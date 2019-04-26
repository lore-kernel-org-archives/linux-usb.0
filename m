Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB26AC43219
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 12:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AA30206C1
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 12:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfDZMol (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 08:44:41 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.66]:52987 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbfDZMok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 08:44:40 -0400
Received: from [46.226.52.199] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-west-1.aws.symcld.net id D4/28-23323-53DF2CC5; Fri, 26 Apr 2019 12:44:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsUyo1hfUtfk76E
  Yg6nzFC2OtT1ht1i0rJXZ4t3LCIu5+96yWEz4fYHNgdVj06pONo/Zd38wenzeJOex9/NvlgCW
  KNbMvKT8igTWjEePzrIUPJarmHDkC1MDY49kFyMXh5DAWkaJmU9PMXYxcnLwChhLzDy7Bsjm4
  BAW8JWYfiEBxGQT0JXoumMKUiEioCWxueklM0grs8B2RonlLQfZQBIsAqoSp89/YAGxOYFaO6
  8uZAfpFRLwkbg7SwQkzCygKdG6/Tc7iC0hoCGx4eYxJoitghInZz5hgaiRl2jeOpsZolVW4ui
  lWIhyBYmzWyYyQthJEuf6rrBNYBSYhWTqLCSTZiGZtICReRWjRVJRZnpGSW5iZo6uoYGBrqGh
  ka6hpaWukZGFXmKVbpJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZg6KcUHH+yg/F/V/ohR
  kkOJiVR3vpPh2KE+JLyUyozEosz4otKc1KLDzHKcHAoSfBW/wbKCRalpqdWpGXmAKMQJi3Bwa
  Mkwiv8ByjNW1yQmFucmQ6ROsWoKCXOOx2kTwAkkVGaB9cGi/xLjLJSwryMDAwMQjwFqUW5mSW
  o8q8YxTkYlYR5T4BM4cnMK4Gb/gpoMRPQ4pSVYItLEhFSUg2Mxguuzpnw9jL7h8bXJz/dTPhd
  XOMhKZB+e91//f7dPjMWWO18rRJsUKZkcWDr86/u1/f85uZfOzGvaOJ6lVubJiwSj/Tgr6x45
  ZT6LqtbKvLI475n6rmtzybslzENrNd99K75iMYkxsCEpd+n5d7rKp6853r+G32tF5Pki+5EqB
  ofy6prYOtdrMRSnJFoqMVcVJwIANkQEXX3AgAA
X-Env-Sender: cst@phaseone.com
X-Msg-Ref: server-17.tower-287.messagelabs.com!1556282676!7693941!1
X-Originating-IP: [152.115.47.25]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28576 invoked from network); 26 Apr 2019 12:44:36 -0000
Received: from unknown (HELO Exchange2.phaseone.com) (152.115.47.25)
  by server-17.tower-287.messagelabs.com with AES256-SHA encrypted SMTP; 26 Apr 2019 12:44:36 -0000
Received: from cstu16.phaseone.com (172.16.2.207) by Exchange2.phaseone.com
 (172.16.1.180) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 26 Apr
 2019 14:44:34 +0200
Message-ID: <1556282666.6914.46.camel@phaseone.com>
Subject: Re: Use device tree to disable U1/U2 in gadget devices based on DWC3
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mnarani@xilinx.com" <mnarani@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Date:   Fri, 26 Apr 2019 14:44:26 +0200
In-Reply-To: <Pine.LNX.4.44L0.1904241423540.1443-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1904241423540.1443-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.2.207]
X-ClientProxiedBy: Exchange3.phaseone.com (172.16.1.184) To
 Exchange2.phaseone.com (172.16.1.180)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-04-24 at 14:33 -0400, Alan Stern wrote:
> On Wed, 24 Apr 2019, Claus H. Stovgaard wrote:
> 
> > 
> > Hi Balbi and other USB developers.
> > 
> > I am developing camera devices based on Xilinx ZynqMP, using the
> > gadget framework and the build-in dwc3 core of the ZynqMP as USB3
> > controller and the build-in Cirrus SERDES as phy.
> > Testing with a number of hosts and Windows 7, has shown sporadic
> > reconnects when leaving U2/U1, caused by failing link training,
> > where
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
> > * snps,u1_disable_as_gadget: When set the core will not enable U1
> > if
> > requested from host, nor initiate U1.
> > * snps,u2_disable_as_gadget: When set the core will not enable U2
> > if
> > requested from host, nor initiate U2.
> > 
> > If you think this might be something which can be upstreamed I will
> > prepare the code and send a patch for discussion.
> > On the other hand, if you think that disabling U1/U2 via device
> > tree
> > as suggested should not be a feature no need for me to try making
> > it
> > a feature.
> Speaking as an interested bystander, I would first wonder why your
> hardware fails during link training.  If it is properly designed,
> that
> should not happen.  The fact that it does happen suggests your
> devices
> might also experience problems during normal data transport.

Unfortunately I don't know the root cause of the failing link training
when leaving U2 yet. I can see the link training fail with a beagle
analyzer, but have not had the possibility for looking at the signals
when it happens. Have tested our hardware with a keysight setup
(DSAV134A) resulting it being compliant according to the keysight USB
3.1 compliance test software (U7243C-1TP/SR).

To set the error rate into perspective, running several of our 100
mega-pixel camera (above 100 MB/s for each) in parallel for a 19 hour
test, resulted in 1 unit having no reconnects, 1 having 2 reconnects
and 1 having 4 reconnects. Here we constant enters and exit U0/U1/U2.

As our industrial cameras often work in pretty noisy environment like
an airplane, means we also is trying to reduce insertion loss and
improve cabling etc. to help if the issue is caused by a signal
integrity element.

In short, I am trying to figure out the root cause for the link
training failing, but as it is very hard to find, I need to pursue the
option for disabling U1/U2, as it works very effective.


> Second, the bindings you suggested would not be accepted by the 
> devicetree maintainers.  The whole idea behind devicetree is that it 
> describes the hardware, not the software.  Things like 
> u1_disable_as_gadget are software concepts and so do not belong in a 
> devicetree description.
> 
> You might be better off creating sysfs attribute files for disabling
> entry into U1 and U2.  Alternatively, if you really want to do it
> through devicetree, you should create a binding that does describe
> your
> hardware properties, such as "u1-and-u2-are-broken", or
> "broken-link-training", or something else along those lines.

Thanks. A very good point, and exactly the kind of input I hoped to
get.
Using a sysfs attribute also fit very nice with the
usb3_hardware_lpm_u1 and usb3_hardware_lpm_u2 sysfs files for enabling
/ disabling u1/u2 from the host side.
Will look into setting it via 2 files inside the configfs / usb_gadget
interface.

/Claus


> 
> Alan Stern
> 

