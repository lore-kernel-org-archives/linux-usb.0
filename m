Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D52C43219
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BF5B206E0
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NT3StgRz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfDZNr7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 09:47:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38740 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfDZNr6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 09:47:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id w15so4517411wmc.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=WxYSUz4M7fT6dsweBH7+ShBi95N48xYFy+VIJReloAg=;
        b=NT3StgRzg7Jyy6JRddZi8P7Ud1auYmjPmD8I0G2JfJcP/T1lV+MqLyNeWNSGsDuXdV
         lY/W1abWNYkA/Iy7lqlTswH4ZBQEsJKGt7l2F1uImPXPn/PN1j0WlF1NW8JrsELKGvhr
         Q0YNPfMkH+8rfvO/0JkwhmxwuiG44oBfAsBubyL3EVAskLpelJAN7e7mAsb1zh2ByNW7
         o4Z1wQgUyMXm2qREiaGoPDi8Frn132mf19Kws1Dw3nnoQ1QWhH7ybd+Gc8wAy/kr2qqt
         b5/omU0HlyN9guzl86H4Q5J6CXt1jo76Y2G+R/OrI+WZRtQFZxEKOmsHZAPCaK3WGt4F
         fFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=WxYSUz4M7fT6dsweBH7+ShBi95N48xYFy+VIJReloAg=;
        b=Hb27rcwSh855Y9oP4VphXfS3k1Am8sHaEdtth5ehlf29oZS1StfZ/gsX0KbKDzjTEv
         EAOqCpCSKkiqMNm16VOoW8eYaIlky/N5sFkrbFlERxtAo7SgeyZYd35jKK2wJYOQ1mvz
         O3WVSudiTS03p2ubxfud7/9UfIxiicv9asgnnKY7PFuPOoUXoZcz+LlxOsQVYbufTCCj
         pLuFzH+D7T1p6WF7nFpsZoy3qS/EgFOgz5jOtgL7xdqbtXg/jlRJ1aGK5EIpHHLRM3A5
         ipYxLRrfQ9J5DDjoFqfHSnAFLfkCNbb9aJiwt1CXoD+gGigIRUVXIfBD3vSMJT2yMXX7
         s0wQ==
X-Gm-Message-State: APjAAAU5G/ajXu4HSvlWW+la8wrHSyNirk6EuHJ2bxBsUtgceaQmyTGD
        JNu0y8MSDS+IvvNVHas+Y0noYjQ7
X-Google-Smtp-Source: APXvYqwDn+KrknGkRrFbp1DZJSYgnIpmT/hv6Tuxc1M5DrnUtq0KXlqo6TaXsSY/bvbOd5dXnGAo9Q==
X-Received: by 2002:a1c:f909:: with SMTP id x9mr8081404wmh.18.1556286476357;
        Fri, 26 Apr 2019 06:47:56 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id s189sm48161097wmf.45.2019.04.26.06.47.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 06:47:55 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Linux crash when using FTDI FT232R USB to serial converter on AMD
 boards.
To:     linux-usb@vger.kernel.org
Message-ID: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
Date:   Fri, 26 Apr 2019 15:47:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,
we are development and manufacturing company that use your FT232R serial 
converter for couple of years with our software. We consume about a 
hundreds pcs of FT232R per yer. We use FT232R as USB serial converter 
with direct access (no virtual serial port) and as a "hardware key" 
using FTDIChip-ID. We operate our software with FT232R converters on 
Windows and Debian Linux operating system.

We have used Intel motherboards with Intel processors so far. We want to 
use AMD motherboards with AMD processors too. *We made a couple of tests 
on AMD motherboards with AMD processors and Debian Linux 9.6, but we 
have come across a big problem.
**When we open internal EEPROM of FT232R for reading, there will arise 
many error messages in system log files. And then Debian Linux crash 
after some time!*


_1) Hardware configurations:_
- motherboards with AMD A320M chipset:
   - MSI A320M PRO-VD PLUS, 
https://www.msi.com/Motherboard/support/A320M-PRO-VD-PLUS
   - ASUS PRIME A320M-K, https://www.asus.com/Motherboards/PRIME-A320M-K
   - GIGABYTE A320M-S2H, 
https://www.gigabyte.com/Motherboard/GA-A320M-S2H-rev-1x#kf
- latest bios installed, default bios configuration loaded,
- CPU AMD Athlon 200GE, AMD Ryzen 3 2200G
- 4GB RAM, SSD drive Kingston A400 120GB

_2a) Operating system A:_
- Debian Linux 9.6 64bit, https://www.debian.org/distrib/, 
https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.6.0-amd64-netinst.iso
- installed from Netinst installer WITHOUT graphic dekstop, default 
configuration
- tested kernels
   - default kernel 4.9.0.8-amd64, 
https://packages.debian.org/stretch/linux-image-4.9.0-8-amd64
   - backports kernel 4.18.0-0.bpo.1-amd64, 
https://packages.debian.org/stretch-backports/linux-image-4.18.0-0.bpo.1-amd64

_2b) Operating system B:_
- Ubuntu server 19.04 64bit, http://releases.ubuntu.com/19.04/, 
http://releases.ubuntu.com/19.04/ubuntu-19.04-live-server-amd64.iso
- installed WITHOUT graphic dekstop, default configuration
- tested kernels
   - default kernel 5.0.0-amd64, 
https://packages.debian.org/stretch/linux-image-4.9.0-8-amd64
   - experimental kernel 5.0.9-050009-generic amd64, 
https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.0.9/

_3) Drivers_
- libftd2xx drivers version 1.4.8, https://www.ftdichip.com/Drivers/D2XX.htm

_4) Performed tests_
You can repeat this test:
- connect FT232R into USB2.0 port (not USB3 port!)
- use examples in directory: ...\libftd2xx-i386-1.4.8.tar\release\examples\
- add parameter "-m32" to "CFLAGS" variable into "Rules.make" file
- compiled "\examples\EEPROM\user\read\"
- run script "test.sh" - see attached file
- *Debian Linux or Ubuntu server crashes after some minutes* - see 
attached kernel logs from our system
- see "kern.log" https://paste.ee/p/xxIZ2


_5) Very important note_
*This problem occurs when FT232R is connected into USB2.0 port only!*
When it is connected into USB3 port, all works fine, no error messages, 
no crash.

_6) Other test that we made_
- we made other tests on Windows 10
   - same configuration with ASUS PRIME A320M-K motherboard
   - latest drivers + latest FTDI drivers
   - FT232R connected to USB2.0 or USB3 - no problem

- we made the same tests on Intel architecture (that we use now)
   - motherboard MSI B250M PRO-VH, CPU Intel Pentium G4560, 4GB RAM, SSD 
drive Kingston A400 120GB
   - same operating system Debian Linux 9.6 64bit as descripted above
   - FT232R connected to USB2.0 or USB3 - no problem

-- 
starosta

