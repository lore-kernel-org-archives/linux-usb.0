Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06963C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5D162171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=halemmerich.com header.i=@halemmerich.com header.b="R6l1vOPB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfDSTkf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:40:35 -0400
Received: from box.halemmerich.com ([172.104.217.94]:46023 "EHLO
        box.halemmerich.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfDSTke (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 15:40:34 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Apr 2019 15:40:33 EDT
Received: from authenticated-user (box.halemmerich.com [172.104.217.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by box.halemmerich.com (Postfix) with ESMTPSA id E7A041E339;
        Fri, 19 Apr 2019 14:33:52 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=halemmerich.com;
        s=mail; t=1555702433;
        bh=yr3lqu4M0sf2x+srgOw5VC/FRQoiGAn5iwZJzABAzGs=;
        h=To:From:Subject:Date:From;
        b=R6l1vOPBASZbLmM7+hxwGGMkql6avckwg2DtTXQzqEtUrUuGj3HdlrCik4QSF39h6
         wCxQWT5TKKfykOWeF2/lhCp0nR5uze3r/W6TJ8tTet4tXXsrfLk3DxZd7QSaVvMkcQ
         rjBiQRYOBkmV1+uEFHkDyLJsHbkXVl58v3dq+lKnyGRLRn4vW/IH7LZV1NjkmWd1SN
         cq1TPUzbQK2Y73f5P1sgVAvFiGK+lLrttAHB1zokhZ+2JN5XO2nZyzvhJD50KJhIN1
         MK2A1O20GgCGlrtQKeNU3p9Z0m8ZekdaYHZWR8djZWrmR0rEBgP5QvGRHMyM1AFQb8
         d1yMCvWTSjcmw==
To:     linux-usb@vger.kernel.org, hminas@synopsys.com
From:   Hal Emmerich <hal@halemmerich.com>
Subject: usb: dwc2: Usb wifi dongle fails to initialize with Frame Overrun
 errors
Message-ID: <b7a29f1a-b4a2-0f88-edda-efcbb7fe6ead@halemmerich.com>
Date:   Fri, 19 Apr 2019 14:33:52 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,


I have a ar9271 wireless dongle which is known to not work well with dwc2.

When inserted, it may initialize properly if the system was just

rebooted but after that will error out.

With dwc2 verbose debug enabled, I see a bulk transfer followed by a 
frame overrun interrupt.

The log of this is below. I attempted to get a verbose log of it 
functioning, but was unable to.

Not sure if that might indicate a race condition since it does sometimes 
work when verbose debug

is disabled?

Is the frame overrun error indicating the message was received after the 
frame? Or is it saying

one of the dma buffers is full? I can't find a reference to frame 
overrun errors in the usb error list.

I also recorded the transactions with wireshark and can provide those if 
it would help.

[   93.104662] usb 2-1: ath9k_htc: Transferred FW: 
ath9k_htc/htc_9271-1.4.0.fw, size: 51008
[   93.113803] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.119568] dwc2 ff580000.usb: urb_enqueue, urb 1032f3a7
[   93.125510] dwc2 ff580000.usb:   Device address: 2
[   93.130917] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.136088] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.142429] dwc2 ff580000.usb:   Speed: HIGH
[   93.147209] dwc2 ff580000.usb:   Max packet size: 512
[   93.152865] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.159005] dwc2 ff580000.usb:   Transfer buffer: 56fd7fba, Transfer 
DMA: 2beb0000
[   93.167476] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.175362] dwc2 ff580000.usb:   Interval: 0
[   93.180145] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.188228] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.193384] dwc2 ff580000.usb: dwc2_assign_and_init_hc(bd1a24cd,024930b4)
[   93.200966] dwc2 ff580000.usb: dwc2_hc_init()
[   93.205819] dwc2 ff580000.usb: DMA enabled
[   93.210389] dwc2 ff580000.usb: desc DMA disabled
[   93.215542] dwc2 ff580000.usb: set HCINTMSK to 00000006
[   93.221374] dwc2 ff580000.usb: set HAINTMSK to 00000040
[   93.227206] dwc2 ff580000.usb: set GINTMSK to f3000806
[   93.232941] dwc2 ff580000.usb: set HCCHAR(6) to 00889200
[   93.238871] dwc2 ff580000.usb: dwc2_hc_init: Channel 6
[   93.244606] dwc2 ff580000.usb:  Dev Addr: 2
[   93.249369] dwc2 ff580000.usb:  Ep Num: 2
[   93.253940] dwc2 ff580000.usb:  Is In: 1
[   93.258412] dwc2 ff580000.usb:  Is Low Speed: 0
[   93.263565] dwc2 ff580000.usb:  Ep Type: 2
[   93.268231] dwc2 ff580000.usb:  Max Pkt: 512
[   93.273093] dwc2 ff580000.usb: Queue non-periodic transactions
[   93.279606] dwc2 ff580000.usb:   NP Tx Req Queue Space Avail (before 
queue): 8
[   93.287672] dwc2 ff580000.usb:   NP Tx FIFO Space Avail (before 
queue): 128
[   93.295447] dwc2 ff580000.usb: dwc2_hc_start_transfer()
[   93.301280] dwc2 ff580000.usb: no split
[   93.305559] dwc2 ff580000.usb: Wrote 01004000 to HCTSIZ(6)
[   93.311683] dwc2 ff580000.usb: dwc2_hc_start_transfer: Channel 6
[   93.318389] dwc2 ff580000.usb:  Xfer Size: 16384
[   93.323639] dwc2 ff580000.usb:  Num Pkts: 32
[   93.328501] dwc2 ff580000.usb:  Start PID: 0
[   93.333362] dwc2 ff580000.usb: Wrote 2beb0000 to HCDMA(6)
[   93.339390] dwc2 ff580000.usb:  Multi Cnt: 1
[   93.344251] dwc2 ff580000.usb: Wrote 80989200 to HCCHAR(6)
[   93.350434] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.356189] dwc2 ff580000.usb: urb_enqueue, urb 92464acd
[   93.362146] dwc2 ff580000.usb:   Device address: 2
[   93.367514] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.372725] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.379118] dwc2 ff580000.usb:   Speed: HIGH
[   93.383910] dwc2 ff580000.usb:   Max packet size: 512
[   93.389581] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.395730] dwc2 ff580000.usb:   Transfer buffer: 4231e933, Transfer 
DMA: 2beb8000
[   93.404201] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.412090] dwc2 ff580000.usb:   Interval: 0
[   93.416871] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.424954] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.430146] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.435896] dwc2 ff580000.usb: urb_enqueue, urb 2cf45f79
[   93.441840] dwc2 ff580000.usb:   Device address: 2
[   93.447222] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.452408] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.458758] dwc2 ff580000.usb:   Speed: HIGH
[   93.463544] dwc2 ff580000.usb:   Max packet size: 512
[   93.469199] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.475339] dwc2 ff580000.usb:   Transfer buffer: ae4d9b47, Transfer 
DMA: 2bec0000
[   93.483810] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.491695] dwc2 ff580000.usb:   Interval: 0
[   93.496476] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.504568] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.509777] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.515530] dwc2 ff580000.usb: urb_enqueue, urb e322725e
[   93.521479] dwc2 ff580000.usb:   Device address: 2
[   93.526842] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.532011] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.538342] dwc2 ff580000.usb:   Speed: HIGH
[   93.543123] dwc2 ff580000.usb:   Max packet size: 512
[   93.548774] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.554914] dwc2 ff580000.usb:   Transfer buffer: 8e9d9e9b, Transfer 
DMA: 2bec8000
[   93.563382] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.571270] dwc2 ff580000.usb:   Interval: 0
[   93.576048] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.584130] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.589316] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.595067] dwc2 ff580000.usb: urb_enqueue, urb 2533b990
[   93.601011] dwc2 ff580000.usb:   Device address: 2
[   93.606378] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.611545] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.617877] dwc2 ff580000.usb:   Speed: HIGH
[   93.622654] dwc2 ff580000.usb:   Max packet size: 512
[   93.628306] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.634443] dwc2 ff580000.usb:   Transfer buffer: b4fb1405, Transfer 
DMA: 2bed0000
[   93.642914] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.650797] dwc2 ff580000.usb:   Interval: 0
[   93.655578] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.663658] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.668842] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.674588] dwc2 ff5800005.usb: urb_enqueue, urb ccee38dd
[   93.680533] dwc2 ff580000.usb:   Device address: 2
[   93.685893] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.691064] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.697386] dwc2 ff580000.usb:   Speed: HIGH
[   93.702165] dwc2 ff580000.usb:   Max packet size: 512
[   93.707814] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.713953] dwc2 ff580000.usb:   Transfer buffer: 9aedefe1, Transfer 
DMA: 2bed8000
[   93.722420] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.730314] dwc2 ff580000.usb:   Interval: 0
[   93.735096] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.743178] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.748360] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.754108] dwc2 ff580000.usb: urb_enqueue, urb 319ee6c4
[   93.760052] dwc2 ff580000.usb:   Device address: 2
[   93.765415] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.770580] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.776912] dwc2 ff580000.usb:   Speed: HIGH
[   93.781689] dwc2 ff580000.usb:   Max packet size: 512
[   93.787341] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.793477] dwc2 ff580000.usb:   Transfer buffer: a4787cb2, Transfer 
DMA: 2bee0000
[   93.801946] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.809829] dwc2 ff580000.usb:   Interval: 0
[   93.814609] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.822688] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.827871] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.833615] dwc2 ff580000.usb: urb_enqueue, urb 5cd74369
[   93.839560] dwc2 ff580000.usb:   Device address: 2
[   93.844919] dwc2 ff580000.usb:   Endpoint: 2, IN
[   93.850086] dwc2 ff580000.usb:   Endpoint type: BULK IN (IN)
[   93.856416] dwc2 ff580000.usb:   Speed: HIGH
[   93.861194] dwc2 ff580000.usb:   Max packet size: 512
[   93.866848] dwc2 ff580000.usb:   Data buffer length: 16384
[   93.872988] dwc2 ff580000.usb:   Transfer buffer: 146bc214, Transfer 
DMA: 2bee8000
[   93.881456] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.889341] dwc2 ff580000.usb:   Interval: 0
[   93.894119] dwc2 ff580000.usb: addr=2, ep_num=2, ep_dir=80, 
ep_type=2, mps=512
[   93.902200] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.907377] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.913139] dwc2 ff580000.usb: urb_enqueue, urb 0386947f
[   93.919118] dwc2 ff580000.usb:   Device address: 2
[   93.924503] dwc2 ff580000.usb:   Endpoint: 3, IN
[   93.929711] dwc2 ff580000.usb:   Endpoint type: INTERRUPT IN (IN)
[   93.936579] dwc2 ff580000.usb:   Speed: HIGH
[   93.941377] dwc2 ff580000.usb:   Max packet size: 64
[   93.946961] dwc2 ff580000.usb:   Data buffer length: 64
[   93.952868] dwc2 ff580000.usb:   Transfer buffer: 9cf61093, Transfer 
DMA: 2b82f500
[   93.961351] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   93.969240] dwc2 ff580000.usb:   Interval: 1
[   93.974023] dwc2 ff580000.usb: addr=2, ep_num=3, ep_dir=80, 
ep_type=3, mps=64
[   93.982010] dwc2 ff580000.usb: dwc2_hcd_qh_add()
[   93.987198] dwc2 ff580000.usb: DWC OTG HCD URB Enqueue
[   93.987285] dwc2 ff580000.usb: dwc2_assign_and_init_hc(bd1a24cd,38ec32c7)
[   93.992945] dwc2 ff580000.usb: urb_enqueue, urb c069ee03
[   94.000517] dwc2 ff580000.usb: dwc2_hc_init()
[   94.000520] dwc2 ff580000.usb: DMA enabled
[   94.000522] dwc2 ff580000.usb: desc DMA disabled
[   94.000527] dwc2 ff580000.usb: set HCINTMSK to 00000006
[   94.006464] dwc2 ff580000.usb:   Device address: 2
[   94.011315] dwc2 ff580000.usb: set HAINTMSK to 000000c0
[   94.011318] dwc2 ff580000.usb: set GINTMSK to f300080e
[   94.011321] dwc2 ff580000.usb: set HCCHAR(7) to 008c9840
[   94.011325] dwc2 ff580000.usb: dwc2_hc_init: Channel 7
[   94.015900] dwc2 ff580000.usb:   Endpoint: 3, IN
[   94.021044] dwc2 ff580000.usb:  Dev Addr: 2
[   94.021046] dwc2 ff580000.usb:  Ep Num: 3
[   94.021049] dwc2 ff580000.usb:  Is In: 1
[   94.021053] dwc2 ff580000.usb:  Is Low Speed: 0
[   94.026889] dwc2 ff580000.usb:   Endpoint type: INTERRUPT IN (IN)
[   94.032227] dwc2 ff580000.usb:  Ep Type: 3
[   94.032229] dwc2 ff580000.usb:  Max Pkt: 64
[   94.032233] dwc2 ff580000.usb: Queue periodic transactions
[   94.032236] dwc2 ff580000.usb:   P Tx Req Queue Space Avail (before 
queue): 8
[   94.038071] dwc2 ff580000.usb:   Speed: HIGH
[   94.043798] dwc2 ff580000.usb:   P Tx FIFO Space Avail (before 
queue): 256
[   94.043801] dwc2 ff580000.usb: dwc2_hc_start_transfer()
[   94.043804] dwc2 ff580000.usb: no split
[   94.043807] dwc2 ff580000.usb: Wrote 00080040 to HCTSIZ(7)
[   94.049739] dwc2 ff580000.usb:   Max packet size: 64
[   94.055467] dwc2 ff580000.usb: dwc2_hc_start_transfer: Channel 7
[   94.055469] dwc2 ff580000.usb:  Xfer Size: 64
[   94.055472] dwc2 ff580000.usb:  Num Pkts: 1
[   94.055476] dwc2 ff580000.usb:  Start PID: 0
[   94.060631] dwc2 ff580000.usb:   Data buffer length: 64
[   94.065386] dwc2 ff580000.usb: Wrote 2b82f500 to HCDMA(7)
[   94.065391] dwc2 ff580000.usb:  Multi Cnt: 1
[   94.065395] dwc2 ff580000.usb: Wrote 809c9840 to HCCHAR(7)
[   94.069969] dwc2 ff580000.usb:   Transfer buffer: c30c74ed, Transfer 
DMA: 2b82fb00
[   94.074473] dwc2 ff580000.usb: DWC OTG HCD Interrupt Detected 
gintsts&gintmsk=0x02000008
[   94.079601] dwc2 ff580000.usb:   Setup buffer: (null), Setup DMA: 
00000000
[   94.086398] dwc2 ff580000.usb: dwc2_hc_intr()
[   94.086400] dwc2 ff580000.usb: HAINT=00000080
[   94.086404] dwc2 ff580000.usb: --Host Channel Interrupt--, Channel 7
[   94.086408] dwc2 ff580000.usb:   hcint 0x00000202, hcintmsk 
0x00000006, hcint&hcintmsk 0x00000002
[   94.091069] dwc2 ff580000.usb:   Interval: 1
[   94.095827] dwc2 ff580000.usb: --Host Channel 7 Interrupt: Channel 
Halted--
[   94.095830] dwc2 ff580000.usb: --Host Channel 7 Interrupt: DMA 
Channel Halted--
[   94.095836] dwc2 ff580000.usb: --Host Channel 7 Interrupt: Frame 
Overrun--
[   94.268674] dwc2 ff580000.usb: dwc2_halt_channel()
[   94.274021] dwc2 ff580000.usb: DMA enabled
[   94.278593] dwc2 ff580000.usb:   dwc2_release_channel: channel 7, 
halt_status 8
[   94.286750] dwc2 ff580000.usb: dwc2_deactivate_qh(bd1a24cd,38ec32c7,0)
[   94.294234] dwc2 ff580000.usb: dwc2_hcd_qh_deactivate()

