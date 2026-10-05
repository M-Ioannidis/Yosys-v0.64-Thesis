/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012  Claire Xenia Wolf <claire@yosyshq.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

#include "kernel/register.h"
#include "kernel/log.h"
#include <stdlib.h>
#include <stdio.h>
#include <filesystem>
#include <iostream>
#include <cstdio>

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct ProcPass : public Pass {
	ProcPass() : Pass("proc", "translate processes to netlists") { }
	void help() override
	{
		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    proc [options] [selection]\n");
		log("\n");
		log("This pass calls all the other proc_* passes in the most common order.\n");
		log("\n");
		log("    proc_clean\n");
		log("    proc_rmdead\n");
		log("    proc_prune\n");
		log("    proc_init\n");
		log("    proc_arst\n");
		log("    proc_rom\n");
		log("    proc_mux\n");
		log("    proc_dlatch\n");
		log("    proc_dff\n");
		log("    proc_memwr\n");
		log("    proc_clean\n");
		log("    opt_expr -keepdc\n");
		log("\n");
		log("This replaces the processes in the design with multiplexers,\n");
		log("flip-flops and latches.\n");
		log("\n");
		log("The following options are supported:\n");
		log("\n");
		log("    -nomux\n");
		log("        Will omit the proc_mux pass.\n");
		log("\n");
		log("    -norom\n");
		log("        Will omit the proc_rom pass.\n");
		log("\n");
		log("    -global_arst [!]<netname>\n");
		log("        This option is passed through to proc_arst.\n");
		log("\n");
		log("    -ifx\n");
		log("        This option is passed through to proc_mux. proc_rmdead is not\n");
		log("        executed in -ifx mode.\n");
		log("\n");
		log("    -noopt\n");
		log("        Will omit the opt_expr pass.\n");
		log("\n");
	}
	void execute(std::vector<std::string> args, RTLIL::Design *design) override
	{
		std::string global_arst;
		bool ifxmode = false;
		bool nomux = false;
		bool noopt = false;
		bool norom = false;
		bool hej = false; 
		std::string loel;
		std::string show;
		std::vector<std::string> name;
		std::vector<int> size1;
		std::vector<int> size2;
		std::vector<int> img;
		log_header(design, "Executing PROC pass (convert processes to netlists).\n");
		log_push();

		size_t argidx;
		for (argidx = 1; argidx < args.size(); argidx++)
		{
			if (args[argidx] == "-nomux") {
				nomux = true;
				continue;
			}
			if (args[argidx] == "-global_arst" && argidx+1 < args.size()) {
				global_arst = args[++argidx];
				continue;
			}
			if (args[argidx] == "-ifx") {
				ifxmode = true;
				continue;
			}
			if (args[argidx] == "-noopt") {
				noopt = true;
				continue;
			}
			if (args[argidx] == "-norom") {
				norom = true;
				continue;
			}
			if (args[argidx] == "-count") {
				loel = args[++argidx];
				continue;
			}
			if (args[argidx] == "-show") {
				show = args[++argidx];
				if (show[0] == '"')
					show = show.substr(1, show.size() - 2);
				continue;
			}
			if (args[argidx] == "-tech") {
				hej = true;
				continue; 
			}
			break;
		}
		extra_args(args, argidx, design);
		int temp = 1;
		for (auto i : design->selected_modules()) {
			std::string mod_name = log_id(i->name);
			std::replace(mod_name.begin(), mod_name.end(), '\'', '_');
			Pass::call(design, stringf("%s -prefix %s%d_hierarchy_%s %s", show, hej ? loel + "." : "0", temp, mod_name, hej ? "" : i->name )) ;
			name.push_back(mod_name);
			img.push_back(std::filesystem::file_size(stringf("%s%d_hierarchy_%s.png", hej ? loel + "." : "0", temp, name.back()).c_str()));
			Pass::call(design, stringf("write_rtlil %s%d_hierarchy_%s.il", hej ? loel + "." : "0", temp, name.back()));
			size1.push_back(std::filesystem::file_size(stringf("%s%d_hierarchy_%s.il", hej ? loel + "." : "0", temp, name.back()).c_str()));
			temp = temp + 1;
		}
		Pass::call(design, "proc_clean");
		for (auto i : name){
			Pass::call(design, stringf("write_rtlil %s.1_proc_clean_%s.il", loel, i));	
			size2.push_back(std::filesystem::file_size(stringf("%s.1_proc_clean_%s.il", loel, i).c_str()));
		}
		for (auto i = 0; i < size1.size(); i++){
			if (size1[i] != size2[i]){
				Pass::call(design, stringf("%s -prefix %s.1_proc_clean_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
				size1[i] = size2[i];
				temp = std::filesystem::file_size(stringf("%s.1_proc_clean_%s.png", loel, name[i]).c_str());
				if (temp == img[i]){
					remove(stringf("%s.1_proc_clean_%s.png", loel, name[i]).c_str());
				}
				else {
					img[i] = temp;
				}
			}
		}	
		size2.clear();
		if (!ifxmode){
			Pass::call(design, "proc_rmdead");
			for (auto i : name){
				Pass::call(design, stringf("write_rtlil %s.2_proc_rmdead_%s.il", loel, i));	
				size2.push_back(std::filesystem::file_size(stringf("%s.2_proc_rmdead_%s.il", loel, i).c_str()));
			}
			for (auto i = 0; i < size1.size(); i++){
				if (size1[i] != size2[i]){
					Pass::call(design, stringf("%s -prefix %s.2_proc_rmdead_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
					size1[i] = size2[i];
					temp = std::filesystem::file_size(stringf("%s.2_proc_rmdead_%s.png", loel, name[i]).c_str());
					if (temp == img[i]){
						remove(stringf("%s.1_proc_rmdead_%s.png", loel, name[i]).c_str());
					}
					else {
						img[i] = temp;
					}
				}
			}	
		}
		size2.clear();
		Pass::call(design, "proc_prune");
		for (auto i : name){
			Pass::call(design, stringf("write_rtlil %s.3_proc_prune_%s.il", loel, i));	
			size2.push_back(std::filesystem::file_size(stringf("%s.3_proc_prune_%s.il", loel, i).c_str()));
		}
		for (auto i = 0; i < size1.size(); i++){
			if (size1[i] != size2[i]){
				Pass::call(design, stringf("%s -prefix %s.3_proc_prune_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
				size1[i] = size2[i];
				temp = std::filesystem::file_size(stringf("%s.3_proc_prune_%s.png", loel, name[i]).c_str());
				if (temp == img[i]){
					remove(stringf("%s.3_proc_prune_%s.png", loel, name[i]).c_str());
				}
				else {
					img[i] = temp;
				}
			}
		}	
		size2.clear();
		Pass::call(design, "proc_init");
		if (global_arst.empty())
			Pass::call(design, "proc_arst");
		else
			Pass::call(design, "proc_arst -global_arst " + global_arst);
		if (!norom){
			Pass::call(design, "proc_rom");
			for (auto i : name){
				Pass::call(design, stringf("write_rtlil %s.6_proc_rom_%s.il", loel, i));	
				size2.push_back(std::filesystem::file_size(stringf("%s.6_proc_rom_%s.il", loel, i).c_str()));
			}
			for (auto i = 0; i < size1.size(); i++){
				if (size1[i] != size2[i]){
					Pass::call(design, stringf("%s -prefix %s.6_proc_rom_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
					size1[i] = size2[i];
					temp = std::filesystem::file_size(stringf("%s.6_proc_rom_%s.png", loel, name[i]).c_str());
					if (temp == img[i]){
						remove(stringf("%s.6_proc_rom_%s.png", loel, name[i]).c_str());
					}
					else {
						img[i] = temp;
					}
				}
			}	
			size2.clear();
		}	
		if (!nomux){
			Pass::call(design, ifxmode ? "proc_mux -ifx" : "proc_mux");
			for (auto i : name){
				Pass::call(design, stringf("write_rtlil %s.7_proc_mux_%s.il", loel, i));	
				size2.push_back(std::filesystem::file_size(stringf("%s.7_proc_mux_%s.il", loel, i).c_str()));
			}
			for (auto i = 0; i < size1.size(); i++){
				if (size1[i] != size2[i]){
					Pass::call(design, stringf("%s -prefix %s.7_proc_mux_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
					size1[i] = size2[i];
					temp = std::filesystem::file_size(stringf("%s.7_proc_mux_%s.png", loel, name[i]).c_str());
					if (temp == img[i]){
						remove(stringf("%s.7_proc_mux_%s.png", loel, name[i]).c_str());
					}
					else {
						img[i] = temp;
					}
				}
			}	
			size2.clear();
		}
		Pass::call(design, "proc_dlatch");
		Pass::call(design, "proc_dff");
		Pass::call(design, "proc_memwr");
		for (auto i : name){
			Pass::call(design, stringf("write_rtlil %s.10_proc_memwr_%s.il", loel, i));	
			size2.push_back(std::filesystem::file_size(stringf("%s.10_proc_memwr_%s.il", loel, i).c_str()));
		}
		for (auto i = 0; i < size1.size(); i++){
			if (size1[i] != size2[i]){
				Pass::call(design, stringf("%s -prefix %s.10_proc_memwr_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
				size1[i] = size2[i];
				temp = std::filesystem::file_size(stringf("%s.10_proc_memwr_%s.png", loel, name[i]).c_str());
				if (temp == img[i]){
					remove(stringf("%s.10_proc_memwr_%s.png", loel, name[i]).c_str());
				}
				else {
					img[i] = temp;
				}
			}
		}
		size2.clear();
		Pass::call(design, "proc_clean");
		for (auto i : name){
			Pass::call(design, stringf("write_rtlil %s.11_proc_clean_%s.il", loel, i));	
			size2.push_back(std::filesystem::file_size(stringf("%s.11_proc_clean_%s.il", loel, i).c_str()));
		}
		for (auto i = 0; i < size1.size(); i++){
			if (size1[i] != size2[i]){
				Pass::call(design, stringf("%s -prefix %s.11_proc_clean_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
				size1[i] = size2[i];
				temp = std::filesystem::file_size(stringf("%s.11_proc_clean_%s.png", loel, name[i]).c_str());
				if (temp == img[i]){
					remove(stringf("%s.11_proc_clean_%s.png", loel, name[i]).c_str());
				}
				else {
					img[i] = temp;
				}
			}
		}
		size2.clear();
		if (!noopt){
			Pass::call(design, "opt_expr -keepdc");
			for (auto i : name){
				Pass::call(design, stringf("write_rtlil %s.12_opt_expr_keepdc_%s.il", loel, i));	
				size2.push_back(std::filesystem::file_size(stringf("%s.12_opt_expr_keepdc_%s.il", loel, i).c_str()));
			}
			for (auto i = 0; i < size1.size(); i++){
				if (size1[i] != size2[i]){
					Pass::call(design, stringf("%s -prefix %s.12_opt_expr_keepdc_%s %s", show, loel, name[i], hej ? "" : name[i] ) );
					size1[i] = size2[i];
					temp = std::filesystem::file_size(stringf("%s.12_opt_expr_keepdc_%s.png", loel, name[i]).c_str());
					if (temp == img[i]){
						remove(stringf("%s.12_opt_expr_keepdc_%s.png", loel, name[i]).c_str());
					}
					else {
						img[i] = temp;
					}
				}
			}
			size2.clear();
		}
		log_pop();
	}
} ProcPass;

PRIVATE_NAMESPACE_END
