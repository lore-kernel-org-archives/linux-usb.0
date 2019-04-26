Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7704C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB5FF2077B
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfDZNPG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 09:15:06 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.132]:51383 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbfDZNPG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 09:15:06 -0400
Received: from [46.226.53.55] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.eu-west-1.aws.symcld.net id 44/83-09106-75403CC5; Fri, 26 Apr 2019 13:15:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRWlGSWpSXmKPExsUyo1hfUjec5XC
  Mwdc/jBbH2p6wWyxa1sps8e5lhMXcfW9ZLC6u38loMeH3BTYHNo+upmZ2j02rOtk8Zt/9wejx
  eZOcx97Pv1kCWKNYM/OS8isSWDMmf5nKWrBQpuLm32esDYyXxboYuTiEBNYySqxds5uxi5GTg
  1fAWOJrywKmLkYODmEBX4npFxJATDYBXYmuO6YgFSIC7hJ/Zx1mBGllFtjOKLG85SAbSIJFQF
  Xi07a5YDangLbE9GUzWCHmH2WU+PBhFth8ZgFNidbtv9lBbAkBDYkNN48xQewVlDg58wkLRI2
  8RPPW2cwgi4UEZCWOXoqFKFeQOLtlIiOEnSRxrKmRcQKjwCwkU2chmTQLyaQFjMyrGM2SijLT
  M0pyEzNzdA0NDHQNDY10jQwMdY31Eqt0k/VSS3XLU4tLdA31EsuL9Yorc5NzUvTyUks2MQLjI
  aXgJPMOxmcr0g8xSnIwKYny1n86FCPEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgreX+XCMkGBRan
  pqRVpmDjAyYdISHDxKIrxXQdK8xQWJucWZ6RCpU4y6HDNnPp/LLMSSl5+XKiXOuxmkSACkKKM
  0D24ELElcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMex1kCk9mXgncpldARzABHZGy8hDI
  ESWJCCmpBsa9SxZLcdX+Xbejf1bYFRcV6cNPtvHw8ajG/RA9qNLY4y6+4+mbGPEbv3JsxXvOp
  GtOf7i/WFaoM+Dh5jPW5cvP2oawVux21O/ZMuXfgZUT4wVLpf9cNbG5qbz2g8OR6ITcqMN+oU
  Irwjd7fMvluMUTzNn+k2+WkejE46y715ypndj2x0g3crkSS3FGoqEWc1FxIgDte3ZTDQMAAA=
  =
X-Env-Sender: cst@phaseone.com
X-Msg-Ref: server-12.tower-307.messagelabs.com!1556284502!6678856!1
X-Originating-IP: [152.115.47.25]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13687 invoked from network); 26 Apr 2019 13:15:02 -0000
Received: from unknown (HELO Exchange2.phaseone.com) (152.115.47.25)
  by server-12.tower-307.messagelabs.com with AES256-SHA encrypted SMTP; 26 Apr 2019 13:15:02 -0000
Received: from cstu16.phaseone.com (172.16.2.207) by Exchange2.phaseone.com
 (172.16.1.180) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 26 Apr
 2019 15:15:00 +0200
Message-ID: <1556284501.6914.55.camel@phaseone.com>
Subject: Re: Use device tree to disable U1/U2 in gadget devices based on DWC3
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     Rob Weber <rob@gnarbox.com>, Alan Stern <stern@rowland.harvard.edu>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mnarani@xilinx.com" <mnarani@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Date:   Fri, 26 Apr 2019 15:15:01 +0200
In-Reply-To: <20190425201103.GA26402@coops>
References: <DB8PR01MB60273B2E42CF5FBD2E54ADCBDA3C0@DB8PR01MB6027.eurprd01.prod.exchangelabs.com>
         <Pine.LNX.4.44L0.1904241423540.1443-100000@iolanthe.rowland.org>
         <20190425201103.GA26402@coops>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.2.207]
X-ClientProxiedBy: Exchange2.phaseone.com (172.16.1.180) To
 Exchange2.phaseone.com (172.16.1.180)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426131501.BaHATuMCQWYrTY27_aYdj20DItd-vc1LEpFvOB8KdYE@z>

On Thu, 2019-04-25 at 13:11 -0700, Rob Weber wrote:
> Hi Everyone,
> 
> On Wed, Apr 24, 2019 at 02:33:48PM -0400, Alan Stern wrote:
> > 
> > On Wed, 24 Apr 2019, Claus H. Stovgaard wrote:
> > 
> > > 
> > > Hi Balbi and other USB developers.
> > > 
> > > I am developing camera devices based on Xilinx ZynqMP, using the
> > > gadget framework and the build-in dwc3 core of the ZynqMP as USB3
> > > controller and the build-in Cirrus SERDES as phy.
> > > Testing with a number of hosts and Windows 7, has shown sporadic
> > > reconnects when leaving U2/U1, caused by failing link training,
> > > where
> > > the host resets the bus. Sometime it also means it reconnect via
> > > USB2.
> > > 
> > > So to overcome this, I will like to have the option for disabling
> > > U1/U2 on the core when working with those hosts.
> > > 
> > > Currently I have made a hack in ep0.c where I return EINVAL in
> > > dwc3_ep0_handle_u1 and dwc3_ep0_handle_u2 together with not
> > > setting
> > > DWC3_DCTL_ACCEPTU1ENA and DWC3_DCTL_ACCEPTU2ENA in
> > > dwc3_ep0_set_config
> > > Will though prefer a solution possible to upstream, so was
> > > thinking
> > > about adding two devicetree bindings.
> > > 
> > > * snps,u1_disable_as_gadget: When set the core will not enable U1
> > > if
> > > requested from host, nor initiate U1.
> > > * snps,u2_disable_as_gadget: When set the core will not enable U2
> > > if
> > > requested from host, nor initiate U2.
> > > 
> > > If you think this might be something which can be upstreamed I
> > > will
> > > prepare the code and send a patch for discussion.
> > > On the other hand, if you think that disabling U1/U2 via device
> > > tree
> > > as suggested should not be a feature no need for me to try making
> > > it
> > > a feature.
> > Speaking as an interested bystander, I would first wonder why your
> > hardware fails during link training.  If it is properly designed,
> > that
> > should not happen.  The fact that it does happen suggests your
> > devices
> > might also experience problems during normal data transport.
> I was recently debugging a similar problem where my device would
> improperly transition from U2 to U0. This caused the connection to
> reset
> and the device to be re-enumerated as a USB2 device. Our design uses
> an
> Intel CherryTrail z8550 SoC that has an internal dwc3 USB device
> controller. I worked with Felipe a couple of weeks ago [1] to come up
> with
> the same workaround you mentioned above. I disable device-initiated
> U1/U2
> in ep0_set_config and also return -EINVAL when handling SetFeature
> requests from the USB host. I've attached my patch for kernel 4.9.115
> below for reference.
> 
> Although we have applied this workaround, we still have not
> identified a
> root cause of the issue. Intel has no known errata related to the
> symptoms
> we are experiencing. We've done quite a bit of analysis on our design
> and
> are pretty confident we've followed all design guidelines for USB.
> 
> Cheers,
> Rob Weber
> 
> [1] https://marc.info/?t=155349935600001&r=1&w=2

Thanks for this info, reading through your thread and can see many
similarities.
FYI we are also using a Type-C interface (Using the Cypress CCG4 as
controller), and using a redriver / mux. We are using the tusb1042i

Have previously asked for information from Xilinx for the dwc3 core
(the synopsys documentation), and info regarding the PHY. The serdes
module used as phy is pretty undocumented in the Xilinx documentation,
with many registers left undocumented.

Please keep me posted if you find the root cause for your problem, and
I will do the same.

/Claus
