Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06929C282CE
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 18:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D226721773
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 18:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387817AbfDXSdu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 14:33:50 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:37522 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1733024AbfDXSdu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 14:33:50 -0400
Received: (qmail 6754 invoked by uid 2102); 24 Apr 2019 14:33:48 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Apr 2019 14:33:48 -0400
Date:   Wed, 24 Apr 2019 14:33:48 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Claus H. Stovgaard" <cst@phaseone.com>
cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mnarani@xilinx.com" <mnarani@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: Use device tree to disable U1/U2 in gadget devices based on DWC3
In-Reply-To: <DB8PR01MB60273B2E42CF5FBD2E54ADCBDA3C0@DB8PR01MB6027.eurprd01.prod.exchangelabs.com>
Message-ID: <Pine.LNX.4.44L0.1904241423540.1443-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 24 Apr 2019, Claus H. Stovgaard wrote:

> Hi Balbi and other USB developers.
> 
> I am developing camera devices based on Xilinx ZynqMP, using the
> gadget framework and the build-in dwc3 core of the ZynqMP as USB3
> controller and the build-in Cirrus SERDES as phy.
> Testing with a number of hosts and Windows 7, has shown sporadic
> reconnects when leaving U2/U1, caused by failing link training, where
> the host resets the bus. Sometime it also means it reconnect via
> USB2.
> 
> So to overcome this, I will like to have the option for disabling
> U1/U2 on the core when working with those hosts.
> 
> Currently I have made a hack in ep0.c where I return EINVAL in
> dwc3_ep0_handle_u1 and dwc3_ep0_handle_u2 together with not setting
> DWC3_DCTL_ACCEPTU1ENA and DWC3_DCTL_ACCEPTU2ENA in
> dwc3_ep0_set_config
> Will though prefer a solution possible to upstream, so was thinking
> about adding two devicetree bindings.
> 
> * snps,u1_disable_as_gadget: When set the core will not enable U1 if
> requested from host, nor initiate U1.
> * snps,u2_disable_as_gadget: When set the core will not enable U2 if
> requested from host, nor initiate U2.
> 
> If you think this might be something which can be upstreamed I will
> prepare the code and send a patch for discussion.
> On the other hand, if you think that disabling U1/U2 via device tree
> as suggested should not be a feature no need for me to try making it
> a feature.

Speaking as an interested bystander, I would first wonder why your
hardware fails during link training.  If it is properly designed, that
should not happen.  The fact that it does happen suggests your devices
might also experience problems during normal data transport.

Second, the bindings you suggested would not be accepted by the 
devicetree maintainers.  The whole idea behind devicetree is that it 
describes the hardware, not the software.  Things like 
u1_disable_as_gadget are software concepts and so do not belong in a 
devicetree description.

You might be better off creating sysfs attribute files for disabling
entry into U1 and U2.  Alternatively, if you really want to do it
through devicetree, you should create a binding that does describe your
hardware properties, such as "u1-and-u2-are-broken", or
"broken-link-training", or something else along those lines.

Alan Stern

