Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180C5C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:11:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11E7220717
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gnarbox-com.20150623.gappssmtp.com header.i=@gnarbox-com.20150623.gappssmtp.com header.b="XQbRENQo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387465AbfDYULI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 16:11:08 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46589 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbfDYULH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 16:11:07 -0400
Received: by mail-pl1-f194.google.com with SMTP id o7so315655pll.13
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 13:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=laXzxFGdMgxLj7WUYtZBNsT/irBpR5fkL48ELS/EH+k=;
        b=XQbRENQossYJbSvMg2c0HxMjqjojCCcNdT7gFwcHHbN3tAyes8is9VfIP8ougQV+Jm
         FbeLqSJOJ0JxzvKyCVSKNAfu+fa/GOLA7qqpIp4nPuDUsU69w4opydPD7aPDBxKOM/3D
         o06MogrD5Deyhh0sjrnJucNoutQl7rNdJcoCuxyuJAesdQLq1VfMpl9XRucFNmK7LtVQ
         gtbcUKn/9F5Glx+YZRMdmgDyGymcjlwvZyp5wzk8CcT4SLj0FvkqPAUbXt+s6ANtlU5o
         pC9HyJhpwRbZ83WroFPi8oabl1CMUYTRWqS5TnD4y5HKcOM2xao0MN7riR8/jbAm7Lkp
         nzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=laXzxFGdMgxLj7WUYtZBNsT/irBpR5fkL48ELS/EH+k=;
        b=GX4YwluQlL8WrG/+MkiQe28EAUPQnECFq6n2XcjbBiQdhmwGLZHk4bWet3zyg4Q2Is
         kc2QM+/GehcEqWMOc+gdgdrJrI6TnJmJiDhNPDS+x0KQcc6CMfICpF8R759YWxJdJoN/
         MGAdT2rLfbKheu9gwNv3rYiQLo6cldjmp4ikwZZXlzK1ri+o/xFo+lNQPvuNYZBVQ7N5
         j4f2PHR3ZILQsFtsQTh7qdIbnIvbPLtco+3vgJDEmvZ6/1VU/1bCaTZVQ0mfVt5FCfwx
         ad9N/cQHcm1QycxL981+0cyXOUBGESLAtu93XDT1spLTtjvJRoJZ33pacmzI27kau5sn
         CGeg==
X-Gm-Message-State: APjAAAUaCtI7RSzk7iuFpLnTBGMPb7zp9xi77bF0GF2AxCa1skXX+XR6
        uokEWDEuL747BoLVRyROCsTD5Q==
X-Google-Smtp-Source: APXvYqxdAwVLBXFIxoVwXOjgNbrHX/yXKHSOwwXnt9hs5JirWtLKEUWuOkWZiLQSlV9i59OHx3P6Ag==
X-Received: by 2002:a17:902:2b87:: with SMTP id l7mr41700164plb.130.1556223066706;
        Thu, 25 Apr 2019 13:11:06 -0700 (PDT)
Received: from coops ([47.180.176.91])
        by smtp.gmail.com with ESMTPSA id t12sm44838228pfl.59.2019.04.25.13.11.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2019 13:11:05 -0700 (PDT)
Date:   Thu, 25 Apr 2019 13:11:03 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     "Claus H. Stovgaard" <cst@phaseone.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mnarani@xilinx.com" <mnarani@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: Use device tree to disable U1/U2 in gadget devices based on DWC3
Message-ID: <20190425201103.GA26402@coops>
References: <DB8PR01MB60273B2E42CF5FBD2E54ADCBDA3C0@DB8PR01MB6027.eurprd01.prod.exchangelabs.com>
 <Pine.LNX.4.44L0.1904241423540.1443-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1904241423540.1443-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425201103.xa0UURF4z2qQmFATCEQSKFsxcxDGy8IOpG5yF6cS4p0@z>

Hi Everyone,

On Wed, Apr 24, 2019 at 02:33:48PM -0400, Alan Stern wrote:
> On Wed, 24 Apr 2019, Claus H. Stovgaard wrote:
> 
> > Hi Balbi and other USB developers.
> > 
> > I am developing camera devices based on Xilinx ZynqMP, using the
> > gadget framework and the build-in dwc3 core of the ZynqMP as USB3
> > controller and the build-in Cirrus SERDES as phy.
> > Testing with a number of hosts and Windows 7, has shown sporadic
> > reconnects when leaving U2/U1, caused by failing link training, where
> > the host resets the bus. Sometime it also means it reconnect via
> > USB2.
> > 
> > So to overcome this, I will like to have the option for disabling
> > U1/U2 on the core when working with those hosts.
> > 
> > Currently I have made a hack in ep0.c where I return EINVAL in
> > dwc3_ep0_handle_u1 and dwc3_ep0_handle_u2 together with not setting
> > DWC3_DCTL_ACCEPTU1ENA and DWC3_DCTL_ACCEPTU2ENA in
> > dwc3_ep0_set_config
> > Will though prefer a solution possible to upstream, so was thinking
> > about adding two devicetree bindings.
> > 
> > * snps,u1_disable_as_gadget: When set the core will not enable U1 if
> > requested from host, nor initiate U1.
> > * snps,u2_disable_as_gadget: When set the core will not enable U2 if
> > requested from host, nor initiate U2.
> > 
> > If you think this might be something which can be upstreamed I will
> > prepare the code and send a patch for discussion.
> > On the other hand, if you think that disabling U1/U2 via device tree
> > as suggested should not be a feature no need for me to try making it
> > a feature.
> 
> Speaking as an interested bystander, I would first wonder why your
> hardware fails during link training.  If it is properly designed, that
> should not happen.  The fact that it does happen suggests your devices
> might also experience problems during normal data transport.

I was recently debugging a similar problem where my device would
improperly transition from U2 to U0. This caused the connection to reset
and the device to be re-enumerated as a USB2 device. Our design uses an
Intel CherryTrail z8550 SoC that has an internal dwc3 USB device
controller. I worked with Felipe a couple of weeks ago [1] to come up with
the same workaround you mentioned above. I disable device-initiated U1/U2
in ep0_set_config and also return -EINVAL when handling SetFeature
requests from the USB host. I've attached my patch for kernel 4.9.115
below for reference.

Although we have applied this workaround, we still have not identified a
root cause of the issue. Intel has no known errata related to the symptoms
we are experiencing. We've done quite a bit of analysis on our design and
are pretty confident we've followed all design guidelines for USB.

Cheers,
Rob Weber

[1] https://marc.info/?t=155349935600001&r=1&w=2

---
drivers/usb/dwc3/ep0.c | 26 ++++++++++++++++----------
1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 2331469f943d..78b75d65b435 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -433,10 +433,13 @@ static int dwc3_ep0_handle_feature(struct dwc3 *dwc,
                return -EINVAL;

            reg = dwc3_readl(dwc->regs, DWC3_DCTL);
-            if (set)
-                reg |= DWC3_DCTL_INITU1ENA;
-            else
+            if (set) {
+                /* reg |= DWC3_DCTL_INITU1ENA; */
+                dwc3_trace(trace_dwc3_ep0, "GBX: Skipping U1 Enable");
+                return -EINVAL;
+            } else {
                reg &= ~DWC3_DCTL_INITU1ENA;
+            }
            dwc3_writel(dwc->regs, DWC3_DCTL, reg);
            break;

@@ -448,10 +451,13 @@ static int dwc3_ep0_handle_feature(struct dwc3 *dwc,
                return -EINVAL;

            reg = dwc3_readl(dwc->regs, DWC3_DCTL);
-            if (set)
-                reg |= DWC3_DCTL_INITU2ENA;
-            else
+            if (set) {
+                /* reg |= DWC3_DCTL_INITU2ENA; */
+                dwc3_trace(trace_dwc3_ep0, "GBX: Skipping U2 Enable");
+                return -EINVAL;
+            } else {
                reg &= ~DWC3_DCTL_INITU2ENA;
+            }
            dwc3_writel(dwc->regs, DWC3_DCTL, reg);
            break;

@@ -567,7 +573,7 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
    enum usb_device_state state = dwc->gadget.state;
    u32 cfg;
    int ret;
-    u32 reg;
+    /* u32 reg; */

    cfg = le16_to_cpu(ctrl->wValue);

@@ -594,9 +600,9 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
             * Enable transition to U1/U2 state when
             * nothing is pending from application.
             */
-            reg = dwc3_readl(dwc->regs, DWC3_DCTL);
-            reg |= (DWC3_DCTL_ACCEPTU1ENA | DWC3_DCTL_ACCEPTU2ENA);
-            dwc3_writel(dwc->regs, DWC3_DCTL, reg);
+            /* reg = dwc3_readl(dwc->regs, DWC3_DCTL); */
+            /* reg |= (DWC3_DCTL_ACCEPTU1ENA | DWC3_DCTL_ACCEPTU2ENA); */
+            /* dwc3_writel(dwc->regs, DWC3_DCTL, reg); */
        }
        break;

--
