Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8FEC43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B78620717
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfDYOan convert rfc822-to-8bit (ORCPT
        <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:30:43 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:41392 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726039AbfDYOan (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 10:30:43 -0400
Received: from [67.219.250.101] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id A6/61-26731-194C1CC5; Thu, 25 Apr 2019 14:30:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRWlGSWpSXmKPExsXi5LtOQHfikYM
  xBmsuMFssWtbKbDH1701Giwm/L7A5MHvsnHWX3WP23R+MHp83yQUwR7Fm5iXlVySwZtxbpliw
  jbPiZu98tgbGFexdjJwcQgJ7GSXuno0DsdkEDCXObXkLFhcR0JLY3PSSGcRmFvCT+HSkmxXEF
  hYwl/j5rpkJosZCYt/yZVC2lUT7ucNsIDaLgKrE3K3rwObwClhLXP7ewwaxy0fiwq5GsDmcAr
  4Sd350gdmMAmIS30+tYYLYJS5x68l8MFtCQEBiyZ7zzBC2qMTLx/9YIWwFieYFC9kh6nUkFuz
  +xAZhm0tsfL0Rao62xLKFr5khbhCUODnzCcsERpFZSFbMQtI+C0n7LCTts5C0L2BkXcVokVSU
  mZ5RkpuYmaNraGCga2hopGtobKhrZGCsl1ilm6hXWqxbnlpcomukl1herFdcmZuck6KXl1qyi
  REYcSkFzad3MF5tST/EKMnBpCTKWz39YIwQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7UQ0A5wa
  LU9NSKtMwcYOzDpCU4eJREeF0OA6V5iwsSc4sz0yFSpxgtOQ4sejiXmePewedAcsHNX/OYhVj
  y8vNSpcR52UEaBEAaMkrz4MbB0tMlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8S0Cm8GTm
  lcBtfQV0EBPQQfUWB0AOKklESEk1MEZafl14qPR9tf6kKctZu/ikQ9TlA3YU/toj1hHPoqZ2Q
  31C1sm35gW7OrSnB1ruUOjUdzv0LXzWjI6ci1WGH+TWhiZ/XrRqloVtdpb51t3i05Zf8fQ0D9
  nxX0X9Xu7kemYWsUk3VcT9Z5+qeZPw7dqch4u6/h96FHSsif3gDn33G3sZj5T/PKLEUpyRaKj
  FXFScCAB2PU9BSgMAAA==
X-Env-Sender: Seth.Bollinger@digi.com
X-Msg-Ref: server-15.tower-325.messagelabs.com!1556202640!8831468!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28170 invoked from network); 25 Apr 2019 14:30:40 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
  by server-15.tower-325.messagelabs.com with SMTP; 25 Apr 2019 14:30:40 -0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0439.000; Thu, 25 Apr 2019 09:30:40 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Command ring abort xhci_handshake question
Thread-Topic: Command ring abort xhci_handshake question
Thread-Index: AQHU+2rlrmvb0LXs+0WHTNi8akADJ6ZNQZmAgAACS4A=
Date:   Thu, 25 Apr 2019 14:30:39 +0000
Message-ID: <1CE041A0-34AC-4660-B9A1-14CEA66DC257@digi.com>
References: <Pine.LNX.4.44L0.1904251021290.1503-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904251021290.1503-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.153]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40FE70BBD78C6C4696AD585C24387D66@digi.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Apr 25, 2019, at 9:22 AM, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Are you certain that those places with the very long timeouts are 
> called with interrupts disabled?

I must admit, I have not reviewed all uses of the long xhci_handshakes.  :)  I have reviewed the following instance.

In usb/host/xhci-ring.c:xhci_abort_cmd_ring():

    ret = xhci_handshake(&xhci->op_regs->cmd_ring,
            CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
    if (ret < 0) {
        xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
        xhci_halt(xhci);
        xhci_hc_died(xhci);
        return ret;
    }
    /*
     * Writing the CMD_RING_ABORT bit should cause a cmd completion event,
     * however on some host hw the CMD_RING_RUNNING bit is correctly cleared
     * but the completion event in never sent. Wait 2 secs (arbitrary
     * number) to handle those cases after negation of CMD_RING_RUNNING.
     */
    spin_unlock_irqrestore(&xhci->lock, flags);

The spin_unlock occurs before the completion wait, so I assume that interrupts are disabled in the spin above.  Also, the system does nothing during this period.  No SSH, no serial, no log messages, etc.

Seth

