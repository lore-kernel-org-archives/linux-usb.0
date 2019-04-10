Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65FDC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 16:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D6CF206DF
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 16:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732074AbfDJQch (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 12:32:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:4148 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731370AbfDJQch (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Apr 2019 12:32:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Apr 2019 09:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,334,1549958400"; 
   d="scan'208";a="141673448"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Apr 2019 09:32:30 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hEG9F-000F9r-H2; Thu, 11 Apr 2019 00:32:29 +0800
Date:   Thu, 11 Apr 2019 00:31:45 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     kbuild-all@01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: ucsi: ccg: add firmware flashing support
Message-ID: <201904110046.Bx46coK1%lkp@intel.com>
References: <20190410081545.78464-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190410081545.78464-3-heikki.krogerus@linux.intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on v5.1-rc4 next-20190410]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Heikki-Krogerus/usb-typec-ucsi-Remaining-changes-for-v5-2/20190410-221455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

   drivers/usb/typec/ucsi/ucsi_ccg.c:212:24: sparse: expression using sizeof(void)
   drivers/usb/typec/ucsi/ucsi_ccg.c:212:24: sparse: expression using sizeof(void)
>> drivers/usb/typec/ucsi/ucsi_ccg.c:690:16: sparse: restricted __le16 degrades to integer
   drivers/usb/typec/ucsi/ucsi_ccg.c:698:24: sparse: restricted __le16 degrades to integer
   drivers/usb/typec/ucsi/ucsi_ccg.c:735:26: sparse: restricted __le16 degrades to integer
   drivers/usb/typec/ucsi/ucsi_ccg.c:737:33: sparse: restricted __le16 degrades to integer
   drivers/usb/typec/ucsi/ucsi_ccg.c:777:37: sparse: restricted __le16 degrades to integer

vim +690 drivers/usb/typec/ucsi/ucsi_ccg.c

   680	
   681	static bool ccg_check_vendor_version(struct ucsi_ccg *uc,
   682					     struct version_format *app,
   683					     struct fw_config_table *fw_cfg)
   684	{
   685		struct device *dev = uc->dev;
   686	
   687		/* Check if the fw build is for supported vendors.
   688		 * Add all supported vendors here.
   689		 */
 > 690		if (app->build != (('n' << 8) | 'v')) {
   691			dev_info(dev, "current fw is not from supported vendor\n");
   692			return false;
   693		}
   694	
   695		/* Check if the new fw build is for supported vendors
   696		 * Add all supported vendors here.
   697		 */
   698		if (fw_cfg->app.build != (('n' << 8) | 'v')) {
   699			dev_info(dev, "new fw is not from supported vendor\n");
   700			return false;
   701		}
   702		return true;
   703	}
   704	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
