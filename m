Return-Path: <SRS0=HLg3=SJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FCFC10F0E
	for <linux-usb@archiver.kernel.org>; Sun,  7 Apr 2019 10:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50BDA213F2
	for <linux-usb@archiver.kernel.org>; Sun,  7 Apr 2019 10:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Wi8CNYbA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfDGKcu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 7 Apr 2019 06:32:50 -0400
Received: from mout.gmx.net ([212.227.15.19]:35691 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbfDGKcu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Apr 2019 06:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554633154;
        bh=ELPzC6hMDeTHuZkvWY+xrjrKoXlo3msNknQjDNar2wc=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=Wi8CNYbAJzju3vSI/FmvoXA4wwG+AWQDCN66PpGhkXL+joKmI6T7vHZNKoqfGJz3L
         PUJrI4oZ1QQM4fX0Bs1Oq1gLAPMlmMTRINqqv2hUvFmwGjryaLdsjLKkIkx/K0tqAG
         1egloWUg6z70gDoBpuPyiBBgltT8XmHGZJRtvhXM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.21] ([193.81.162.161]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LkfdE-1geqkI3A1s-00aVT6; Sun, 07
 Apr 2019 12:32:34 +0200
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@linux.intel.com
From:   Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
Subject: Regression xhci_hcd cmd failed due to incorrect slot or ep state
Message-ID: <0d300c86-4aaa-28d4-cb37-5bc62fa67a9a@gmx.at>
Date:   Sun, 7 Apr 2019 12:32:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE
X-Provags-ID: V03:K1:1wGLrUVoq65Cbm6fVRt0A1pEYi1fMNhJbOB5dBmxEfWTs/nAmG6
 LaqVi6TdFCLj67wUgPpsBX19Dw722huat5arGO8/gbiRul3b4uUedZkp7jxbwRY2iNHYQLz
 VIIZBqypfMA89oNW8DaIvhqDavDcf+fXVOA9p9AAASPWUpkuWTEm7zENS/C6/Hbx2c+iNbl
 vBjOGNigXvpFoN8ICCC8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ln7+09dIBZE=:AL4LH8fXJORE2Hsgdhf8Jt
 ZToaE/TFYha5Dcz04zIsyAHufU3Z1m9yd5SB3bAChqJgKTfwxtvuLcT1VGTxpowAQacthwW5V
 eVhQ0b7MMNV4gCMEwITao3GU0zwRtLlWJ9En7QXxt5w2qYbVb0wasJlLvYLdbPDN0JculVfeZ
 7PhuEabJQhuvb/iz9mSOXYXhYeWMBfkONuK6/7s607cY/CHO7JJe3gkS+UvvO7bR2l4QK0sW9
 SyQamLFnQ5sT6r68TTpOL8cZx3VPR0kaVHgtPDS01JtrbhdWL5DyxQkDkKQzNXnl8T6rprBQi
 +aw3X9mV0IOkEj7Svrh0gxBBXTVU+7xISxuBHpCm2wBu1l96kuRINyBkzRG2CurIbhWkCafEm
 XbRgO10+y803rBnR9PX5DjjJ12Bla96wiCyo9xUZulvqzMKNYNmPRCO0DnaMrn62hfPOEx4Zz
 ybJxFOiR78s+zqpefYvqPTB8ym2lVzw/Z25VT6OiPV5ctrExXtqWcwKC9OPb/Om8r2Eu7sXI6
 TnlB8tp9CNTTM7xXjYSuzi+oLKDGbY1/NhSdG4drVbFIyM3cjh0P8jK92q8JgwtARfEh10jP4
 yRD3hCsLrsNfQmnc4O+1ZsXpCtd8ZbijoteBMnhEvYLpWBOdf5ViwnT3MaEjEg3Ve422XNd2N
 355IkCurRzjlUyrDbMytH57tlIn1NkMah+bsAcWJitzx/UvPmGlCBQ6YWda3v6KoEb6gFEhP3
 WVkHc255qLm+1PRrT22gDX7gSjfWFeNuYuKslbRdrtMiAQFGpD1My+PurD3OUE/HyN1jzLqaA
 KZ2b3pL4hIpvxQZc2tFe97tqMoO26uS14j6RjqZr5bTf9fsEJPmz6DFw+BmGtQqglf+oXXh8n
 lDmC1E0VKyjA1EJNMFqgwVFardO1RIFhaHsIGp/sr41xS0GH3z1S1BboVtpavTiPcqp92htF7
 osprwuL0vsA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When using=C2=A0 the kernel version 4.20 or above my usb wifi stick doesn'=
t
work until I reboot my system, dmesg shows this message when the issue
occurs:

xhci_hcd 0000:15:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slo=
t or ep state

I've found that the problem is caused by this commit:

commit f8f80be501aa2f10669585c3e328fad079d8cb3a
Author: Mathias Nyman <mathias.nyman@linux.intel.com  <mailto:mathias.nyma=
n@linux.intel.com>>
Date:   Thu Sep 20 19:13:37 2018 +0300

     xhci: Use soft retry to recover faster from transaction errors

It looks like it only affects wifi sticks(various models) on specific
hardware configurations(I have this issue on my Ryzen pc, my Intel pc
isn=C2=B4t affected, but someone in the kernel bug tracker mentioned that =
he
has this issue on an Intel notebook as well (only with USB 3.0 ports
though)).
