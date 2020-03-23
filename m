Return-Path: <SRS0=7PBe=5I=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9C9C3F2CD
	for <linux-usb@archiver.kernel.org>; Mon, 23 Mar 2020 16:12:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A361620714
	for <linux-usb@archiver.kernel.org>; Mon, 23 Mar 2020 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584979920;
	bh=wcMYjUxAgWM9UUp/MjToikncsTsDSPkcxq8Zig3+Tb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1AnEytcIwfvMywj10PqdRbJYmusIQYWG9OObdu0dSuDA1N94qh/0nzsH+Pqa1yusf
	 eFzV7TxctCLggSQ4O6JEKG5ZW65n98nypVBpyWDJqEtTmBC7sOEWZOplfjyn8XyRzX
	 IGUxrKFLYO8FOID7Ei5U0WRd+2dnyUrDdFAxF1gk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbgCWQL5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 23 Mar 2020 12:11:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:52408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgCWQL4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Mar 2020 12:11:56 -0400
Received: from localhost (unknown [122.178.205.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22E7D20714;
        Mon, 23 Mar 2020 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584979915;
        bh=wcMYjUxAgWM9UUp/MjToikncsTsDSPkcxq8Zig3+Tb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U2C9OHrkcqnwil0lVzSLtqSCyc5aGR3nA3th3kTJRyNuQIXisaQz3/m1CiIaTWUtl
         iSIo7vHAjRqCo9sKNOOwILWx5x51j301tn2dCEO9N8UE8vfhFhD6nQ2VHheZxzpCBu
         AdhOfcoRdJ00kzL3ofwHEDErV7pNUG0R4ZuLR700=
Date:   Mon, 23 Mar 2020 21:41:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org, Bjorn Andersson" 
        <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v7 1/5] usb: hci: add hc_driver as argument for
 usb_hcd_pci_probe
Message-ID: <20200323161151.GT72691@vkoul-mobl>
References: <20200323153429.GR72691@vkoul-mobl>
 <Pine.LNX.4.44L0.2003231147190.24254-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2003231147190.24254-100000@netrider.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-03-20, 11:48, Alan Stern wrote:
> On Mon, 23 Mar 2020, Vinod Koul wrote:
> 
> > On 23-03-20, 22:49, kbuild test robot wrote:
> > > Hi Vinod,
> > > 
> > > I love your patch! Yet something to improve:
> > 
> > Thanks for the report.
> > 
> > > [auto build test ERROR on v5.6-rc7]
> > > [also build test ERROR on next-20200323]
> > > [cannot apply to usb/usb-testing]
> > > [if your patch is applied to the wrong git tree, please drop us a note to help
> > > improve the system. BTW, we also suggest to use '--base' option to specify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> > > 
> > > url:    https://github.com/0day-ci/linux/commits/Vinod-Koul/usb-xhci-Add-support-for-Renesas-USB-controllers/20200323-203447
> > > base:    16fbf79b0f83bc752cee8589279f1ebfe57b3b6e
> > > config: x86_64-defconfig (attached as .config)
> > > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 006244152d6c7dd6a390ff89b236cc7801834b46)
> > > reproduce:
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # save the attached .config to linux build tree
> > >         COMPILER=clang make.cross ARCH=x86_64 
> > > 
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from drivers/usb/host/uhci-hcd.c:847:
> > > >> drivers/usb/host/uhci-pci.c:297:36: error: passing 'const struct hc_driver *' to parameter of type 'struct hc_driver *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > >            return usb_hcd_pci_probe(dev, id, &uhci_driver);
> > >                                              ^~~~~~~~~~~~
> > >    include/linux/usb/hcd.h:483:27: note: passing argument to parameter 'driver' here
> > >                                 struct hc_driver *driver);
> > 
> > I need to drop the const qualifiers for uhci_driver, I have checked that
> > and will send v8 with this fix
> 
> No, don't remove the qualifier for uhci_driver.  Instead, change 
> usb_hcd_pci_probe(): make driver a pointer to const.

Thanks that is indeed a better idea.

Will send v8 shortly

-- 
~Vinod
