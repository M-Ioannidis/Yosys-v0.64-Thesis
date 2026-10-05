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

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct OptPass : public Pass {
	OptPass() : Pass("opt", "perform simple optimizations") { }
	void help() override
	{
		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    opt [options] [selection]\n");
		log("\n");
		log("This pass calls all the other opt_* passes in a useful order. This performs\n");
		log("a series of trivial optimizations and cleanups. This pass executes the other\n");
		log("passes in the following order:\n");
		log("\n");
		log("    opt_expr [-mux_undef] [-mux_bool] [-undriven] [-noclkinv] [-fine] [-full] [-keepdc]\n");
		log("    opt_merge [-share_all] -nomux\n");
		log("\n");
		log("    do\n");
		log("        opt_muxtree\n");
		log("        opt_reduce [-fine] [-full]\n");
		log("        opt_merge [-share_all]\n");
		log("        opt_share  (-full only)\n");
		log("        opt_dff [-nodffe] [-nosdff] [-keepdc] [-sat]  (except when called with -noff)\n");
		log("        opt_hier (-hier only)\n");
		log("        opt_clean [-purge]\n");
		log("        opt_expr [-mux_undef] [-mux_bool] [-undriven] [-noclkinv] [-fine] [-full] [-keepdc]\n");
		log("    while <changed design>\n");
		log("\n");
		log("When called with -fast the following script is used instead:\n");
		log("\n");
		log("    do\n");
		log("        opt_expr [-mux_undef] [-mux_bool] [-undriven] [-noclkinv] [-fine] [-full] [-keepdc]\n");
		log("        opt_merge [-share_all]\n");
		log("        opt_dff [-nodffe] [-nosdff] [-keepdc] [-sat]  (except when called with -noff)\n");
		log("        opt_hier (-hier only)\n");
		log("        opt_clean [-purge]\n");
		log("    while <changed design in opt_dff>\n");
		log("\n");
		log("Note: Options in square brackets (such as [-keepdc]) are passed through to\n");
		log("the opt_* commands when given to 'opt'.\n");
		log("\n");
		log("\n");
	}
	void execute(std::vector<std::string> args, RTLIL::Design *design) override
	{
		std::string opt_clean_args;
		std::string opt_expr_args;
		std::string opt_reduce_args;
		std::string opt_merge_args;
		std::string opt_dff_args;
		std::string loel;
		std::string temp;
		std::string name;
		std::string show;
		bool opt_share = false;
		bool fast_mode = false;
		bool noff_mode = false;
		bool hier_mode = false;
		bool hej = false;
		int size1;
		int size2;
		int num = 1;
		log_header(design, "Executing OPT pass (performing simple optimizations).\n");
		log_push();

		size_t argidx;
		for (argidx = 1; argidx < args.size(); argidx++) {
			if (args[argidx] == "-purge") {
				opt_clean_args += " -purge";
				continue;
			}
			if (args[argidx] == "-mux_undef") {
				opt_expr_args += " -mux_undef";
				continue;
			}
			if (args[argidx] == "-mux_bool") {
				opt_expr_args += " -mux_bool";
				continue;
			}
			if (args[argidx] == "-undriven") {
				opt_expr_args += " -undriven";
				continue;
			}
			if (args[argidx] == "-noclkinv") {
				opt_expr_args += " -noclkinv";
				continue;
			}
			if (args[argidx] == "-fine") {
				opt_expr_args += " -fine";
				opt_reduce_args += " -fine";
				continue;
			}
			if (args[argidx] == "-full") {
				opt_expr_args += " -full";
				opt_reduce_args += " -full";
				opt_share = true;
				continue;
			}
			if (args[argidx] == "-keepdc") {
				opt_expr_args += " -keepdc";
				opt_dff_args += " -keepdc";
				opt_merge_args += " -keepdc";
				continue;
			}
			if (args[argidx] == "-nodffe") {
				opt_dff_args += " -nodffe";
				continue;
			}
			if (args[argidx] == "-nosdff") {
				opt_dff_args += " -nosdff";
				continue;
			}
			if (args[argidx] == "-sat") {
				opt_dff_args += " -sat";
				continue;
			}
			if (args[argidx] == "-share_all") {
				opt_merge_args += " -share_all";
				continue;
			}
			if (args[argidx] == "-fast") {
				fast_mode = true;
				continue;
			}
			if (args[argidx] == "-noff") {
				noff_mode = true;
				continue;
			}
			if (args[argidx] == "-hier") {
				hier_mode = true;
				continue;
			}
			if (args[argidx] == "-count") {
				loel = args[++argidx];
				temp = loel;
				continue;
			}
			if (args[argidx] == "-temp") {
				hej = true;
				loel = args[++argidx];
				num = stoi(loel);
				continue;
			}
			if (args[argidx] == "-name") {
				name = args[++argidx];
				continue;
			}
			if (args[argidx] == "-show") {
				show = args[++argidx];
				if (show[0] == '"')
					show = show.substr(1, show.size() - 2);
				continue;
			}
			if (args[argidx] == "-size") {
				loel = args[++argidx];
				size1 = stoi(loel);
				continue;
			}
			break;
		}
		extra_args(args, argidx, design);
		if (fast_mode)
		{
			while (1) {
				Pass::call(design, "opt_expr" + opt_expr_args);
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_expr_%s.il", temp, num, hej ? ".1" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_expr_%s.il", temp, num, hej ? ".1" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_expr_%s", show, temp, num, hej ? ".1" : "", name));
					size1 = size2;
				}
				if(!hej)
					num = num + 1;
				Pass::call(design, "opt_merge" + opt_merge_args);
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_merge_%s.il", temp, num, hej ? ".2" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_merge_%s.il", temp, num, hej ? ".2" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_merge_%s", show, temp, num, hej ? ".2" : "", name));
					size1 = size2;
				}
				if(!hej)
					num = num + 1;
				design->scratchpad_unset("opt.did_something");
				if (!noff_mode)
					Pass::call(design, "opt_dff" + opt_dff_args);
				if (design->scratchpad_get_bool("opt.did_something") == false)
					break;
				if (hier_mode){
					Pass::call(design, "opt_hier");
					Pass::call(design, stringf("write_rtlil %s.%d%s_opt_hier_%s.il", temp, num, hej ? ".3" : "", name));
					size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_hier_%s.il", temp, num, hej ? ".3" : "", name).c_str());
					if (size1 != size2){
						Pass::call(design, stringf("%s -prefix %s.%d%s_opt_hier_%s", show, temp, num, hej ? ".3" : "", name));
						size1 = size2;
					}
					if(!hej)
						num = num + 1;
				}
				Pass::call(design, "opt_clean" + opt_clean_args);
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_clean_%s.il", temp, num, hej ? ".4" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_clean_%s.il", temp, num, hej ? ".4" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_clean_%s", show, temp, num, hej ? ".4" : "", name));
					size1 = size2;
				}
				if(!hej)
					num = num + 1;
				log_header(design, "Rerunning OPT passes. (Removed registers in this run.)\n");
			}
			Pass::call(design, "opt_clean" + opt_clean_args);
			Pass::call(design, stringf("write_rtlil %s.%d%s_opt_clean_%s.il", temp, num, hej ? ".5" : "", name));
			
			size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_clean_%s.il", temp, num, hej ? ".5" : "", name).c_str());
			if (size1 != size2){
				Pass::call(design, stringf("%s -prefix %s.%d%s_opt_clean_%s", show, temp, num, hej ? ".5" : "", name));
				size1 = size2;
			}
			if(!hej)
				num = num + 1;
		}
		else
		{
			Pass::call(design, "opt_expr" + opt_expr_args);
			Pass::call(design, stringf("write_rtlil %s.%d%s_opt_expr_%s.il", temp, num, hej ? ".1" : "", name));
			size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_expr_%s.il", temp, num, hej ? ".1" : "", name).c_str());
			if (size1 != size2){
				Pass::call(design, stringf("%s -prefix %s.%d%s_opt_expr_%s", show, temp, num, hej ? ".1" : "", name));
				size1 = size2;
			}
			if(!hej)
				num = num + 1;
			Pass::call(design, "opt_merge -nomux" + opt_merge_args);
			Pass::call(design, stringf("write_rtlil %s.%d%s_opt_merge_%s.il", temp, num, hej ? ".2" : "", name));
			size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_merge_%s.il", temp, num, hej ? ".2" : "", name).c_str());
			if (size1 != size2){
				Pass::call(design, stringf("%s -prefix %s.%d%s_opt_merge_%s", show, temp, num, hej ? ".2" : "", name));
				size1 = size2;
			}
			if(!hej)
				num = num + 1;
			while (1) {
				design->scratchpad_unset("opt.did_something");
				Pass::call(design, "opt_muxtree");
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_muxtree_%s.il", temp, num, hej ? ".3" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_muxtree_%s.il", temp, num, hej ? ".3" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_muxtree_%s", show, temp, num, hej ? ".3" : "", name));
					size1 = size2;
				}
				if(!hej)
					num = num + 1;
				Pass::call(design, "opt_reduce" + opt_reduce_args);
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_reduce_%s.il", temp, num, hej ? ".4" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_reduce_%s.il", temp, num, hej ? ".4" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_reduce_%s", show, temp, num, hej ? ".4" : "", name));
					size1 = size2;
				}
				if(!hej)
					num = num + 1;
				Pass::call(design, "opt_merge" + opt_merge_args);
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_merge_%s.il",  temp, num, hej ? ".5" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_merge_%s.il", temp, num, hej ? ".5" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_merge_%s", show, temp, num, hej ? ".5" : "", name));
					size1 = size2;
				}
				if(!hej)
					num = num + 1;
				if (opt_share){
					Pass::call(design, "opt_share");
					Pass::call(design, stringf("write_rtlil %s.%d%s_opt_share_%s.il", temp, num, hej ? ".6" : "", name));
					size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_share_%s.il", temp, num, hej ? ".6" : "", name).c_str());
					if (size1 != size2){
						Pass::call(design, stringf("%s -prefix %s.%d%s_opt_share_%s", show, temp, num, hej ? ".6" : "", name));
						size1 = size2;
					}
					if(!hej)
						num = num + 1;
				}
				if (!noff_mode)
					Pass::call(design, "opt_dff" + opt_dff_args);
				if (hier_mode){
					Pass::call(design, "opt_hier");
					Pass::call(design, stringf("write_rtlil %s.%d%s_opt_hier_%s.il", temp, num, hej ? ".7" : "", name));
					size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_hier_%s.il", temp, num, hej ? ".7" : "", name).c_str());
					if (size1 != size2){
						Pass::call(design, stringf("%s -prefix %s.%d%s_opt_hier_%s", show, temp, num, hej ? ".7" : "", name));
						size1 = size2;
					}
					if(!hej)
						num = num + 1;
				}
				Pass::call(design, "opt_clean" + opt_clean_args);
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_clean_%s.il", temp, num, hej ? ".8" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_clean_%s.il", temp, num, hej ? ".8" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_clean_%s", show, temp, num, hej ? ".8" : "", name));
					size1 = size2;
				}
				if (!hej)
					num = num + 1;
				
				Pass::call(design, "opt_expr" + opt_expr_args);
				Pass::call(design, stringf("write_rtlil %s.%d%s_opt_expr_%s.il", temp, num, hej ? ".9" : "", name));
				size2 = std::filesystem::file_size(stringf("%s.%d%s_opt_expr_%s.il", temp, num, hej ? ".9" : "", name).c_str());
				if (size1 != size2){
					Pass::call(design, stringf("%s -prefix %s.%d%s_opt_expr_%s", show, temp, num, hej ? ".9" : "", name));
					size1 = size2;
				}
				if(!hej)
					num = num + 1;
				if (design->scratchpad_get_bool("opt.did_something") == false)
					break;
				log_header(design, "Rerunning OPT passes. (Maybe there is more to do..)\n");
			}
		}

		design->optimize();
		design->check();

		log_header(design, "Finished fast OPT passes.%s\n", fast_mode ? "" : " (There is nothing left to do.)");
		log_pop();
	}
} OptPass;

PRIVATE_NAMESPACE_END
