Return-Path: <SRS0=u5rC=SN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC64CC10F13
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 07:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B51FC20873
	for <linux-usb@archiver.kernel.org>; Thu, 11 Apr 2019 07:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfDKHj6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:39:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:52138 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbfDKHj5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Apr 2019 03:39:57 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Apr 2019 00:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,336,1549958400"; 
   d="scan'208";a="163309552"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 11 Apr 2019 00:39:54 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 11 Apr 2019 10:39:53 +0300
Date:   Thu, 11 Apr 2019 10:39:53 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: ucsi: ccg: add firmware flashing support
Message-ID: <20190411073953.GI20058@kuha.fi.intel.com>
References: <20190410081545.78464-3-heikki.krogerus@linux.intel.com>
 <201904110046.Bx46coK1%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <201904110046.Bx46coK1%lkp@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190411073953.FFWbNHWTlc5rxO-5BpfRt99tR4x5RFhTepu2JbBuI_M@z>

Hi Ajay,

On Thu, Apr 11, 2019 at 12:31:45AM +0800, kbuild test robot wrote:
> Hi Heikki,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on v5.1-rc4 next-20190410]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Heikki-Krogerus/usb-typec-ucsi-Remaining-changes-for-v5-2/20190410-221455
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> reproduce:
>         # apt-get install sparse
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
>    drivers/usb/typec/ucsi/ucsi_ccg.c:212:24: sparse: expression using sizeof(void)
>    drivers/usb/typec/ucsi/ucsi_ccg.c:212:24: sparse: expression using sizeof(void)
> >> drivers/usb/typec/ucsi/ucsi_ccg.c:690:16: sparse: restricted __le16 degrades to integer
>    drivers/usb/typec/ucsi/ucsi_ccg.c:698:24: sparse: restricted __le16 degrades to integer
>    drivers/usb/typec/ucsi/ucsi_ccg.c:735:26: sparse: restricted __le16 degrades to integer
>    drivers/usb/typec/ucsi/ucsi_ccg.c:737:33: sparse: restricted __le16 degrades to integer
>    drivers/usb/typec/ucsi/ucsi_ccg.c:777:37: sparse: restricted __le16 degrades to integer
> 
> vim +690 drivers/usb/typec/ucsi/ucsi_ccg.c
> 
>    680	
>    681	static bool ccg_check_vendor_version(struct ucsi_ccg *uc,
>    682					     struct version_format *app,
>    683					     struct fw_config_table *fw_cfg)
>    684	{
>    685		struct device *dev = uc->dev;
>    686	
>    687		/* Check if the fw build is for supported vendors.
>    688		 * Add all supported vendors here.
>    689		 */
>  > 690		if (app->build != (('n' << 8) | 'v')) {

How about a macro for these?

        #define CCG_VERSION_BUILD       (__le16)(...)

>    691			dev_info(dev, "current fw is not from supported vendor\n");
>    692			return false;
>    693		}
>    694	
>    695		/* Check if the new fw build is for supported vendors
>    696		 * Add all supported vendors here.
>    697		 */
>    698		if (fw_cfg->app.build != (('n' << 8) | 'v')) {
>    699			dev_info(dev, "new fw is not from supported vendor\n");
>    700			return false;
>    701		}
>    702		return true;
>    703	}
>    704	

thanks,

-- 
heikki
