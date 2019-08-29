Return-Path: <SRS0=v76c=WZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E6CC3A59F
	for <linux-usb@archiver.kernel.org>; Thu, 29 Aug 2019 07:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC5022339E
	for <linux-usb@archiver.kernel.org>; Thu, 29 Aug 2019 07:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfH2HxN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 29 Aug 2019 03:53:13 -0400
Received: from mga03.intel.com ([134.134.136.65]:23535 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbfH2HxM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 03:53:12 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Aug 2019 00:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; 
   d="scan'208";a="197746759"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 29 Aug 2019 00:53:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 29 Aug 2019 10:53:07 +0300
Date:   Thu, 29 Aug 2019 10:53:07 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     hdegoede@redhat.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        Balaji Manoharan <m.balaji@intel.com>
Subject: Re: [PATCH v3 2/2] usb: roles: intel: Enable static DRD mode for
 role switch
Message-ID: <20190829075307.GD5486@kuha.fi.intel.com>
References: <1567011332-22839-1-git-send-email-saranya.gopal@intel.com>
 <1567011332-22839-2-git-send-email-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567011332-22839-2-git-send-email-saranya.gopal@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

>  static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
> @@ -44,7 +52,7 @@ static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
>  	struct intel_xhci_usb_data *data = dev_get_drvdata(dev);
>  	unsigned long timeout;
>  	acpi_status status;
> -	u32 glk, val;
> +	u32 glk, val, drd_config;

I guess you need to fix that. While at it, please introduce it on its
own line:

        u32 drd_config = DRD_CONFIG_DYNAMIC;


thanks,

-- 
heikki
