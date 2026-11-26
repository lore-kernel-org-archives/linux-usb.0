Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707803;
	b=1S6q7pAqjDTHCNLNAjcLvbmifWl0dd816ey151H836KwPhjmv9LuSDIGJ70j8hZw/fFl
	 5AwaO6H3A7XfJpjb/7Am+Np08aYy/dQnhtbzm1GMPnkx4HNcgEPmHlFnF3zk54ZIAegcu
	 f/GTBRFL5/RKtLXz3dQfdrijVcBaEDIrM+qUdzJQn1f//5ADgoiV42b5NSiuz0/DLsjHA
	 igyjhon8dtoI+1hQat8yxbcoblCIXi5+78qU5P6qqHz7SDDnmmSYFSQYQyadbjuIiiaD6
	 i5rubQWfHoOwI+pQ0ZMeMaPlJ+gYBLhx27Y4GyYHylaB0IVUKlxdImnQqDn0lOqQByQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=YVBNrja65i2mnM/VZ2gi4jXTrddpp+cofp3jUQSl1UU=;
	b=jZaLrIK78dxZ0W+YyEcI4H8Ncd5wG357uLbN9LjZ6U/5G2mRZqrRZEtty0chF8cw8DyQ
	 ekOahJ15Swi8bzOn/HgEU2faiE70dP6fzE2TLxCDgqXCg3rL6c2rZXhtDzxT3R9idBkMu
	 R1Z0JVjMv673M6EvGPYPWIz9zsu2mltWOk3N6cBLXQKIcg5nqkyk4dKea5qTiGi0FHSEO
	 jsVAKTsD9Z+//FC988sT1sEOGVV7acsLkvoTDBEV4pf+yQIOw//VnS6dVJzy1FjvZIkHE
	 1UydBckpl/UNIHoa25IK3SrlLY1+4PF67CFICHaUYJPFWyyGdaKTtsMRT7hdszeV98w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gawronskikot.com;
	spf=pass smtp.mailfrom=gawronskikot.com;
	dkim=pass header.d=gawronskikot.com header.i=@gawronskikot.com header.a=rsa-sha256 header.s=google header.b=CaELDjHE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225C606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 15:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5225C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gawronskikot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gawronskikot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gawronskikot.com header.i=@gawronskikot.com header.a=rsa-sha256 header.s=google header.b=CaELDjHE
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c511c0e2826so821802466b.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:43:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795707802; cv=none;
        d=google.com; s=arc-20260327;
        b=Di1xHfMThNVfcORLVuqQVasQ0IuGnMyvZ1+rXe20xkE/rvzjd5MUQtUQG3FQn2pmJ2
         GkqrNdPS2W5gWYwVSiZcyGJncPdbCjVsgtZNBo3D8EN99CpwIoQ8sKif7l8XVB3/eY+B
         CV3eb5R49ED+d2TzVrsLI2M0E550K+oIUTSS9cVJI6td88l47HjRyzcKEJBYJ3eARRod
         5MK+UjOxRr6GGuPq1c0xfpx004OMfYbZgW7uPTfHb5etWsHViLYdOAQFxTk9AV1EZrA6
         xToDYzmGVqhS7hFqEucdqJh4zE6iPx547zXX0eN3Jj+AoVCxPM61KMXIKD/Z1cN6MH71
         hEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YVBNrja65i2mnM/VZ2gi4jXTrddpp+cofp3jUQSl1UU=;
        fh=58/meS8eo9AjGxdMXwNr099K5fAicO3f60TlyHWn4wk=;
        b=dxNyCVTkP0ytjg30/dbZkpYaoeMnkwrlT5WXszsRT3vg39W0gxUqd7J9S8LHxD653G
         g2ykJUpNXhn3TyKXe3Xn5cHGWJUKxnCP05dj9pP+nB4GzS1uT3sSo3yuQoFnx6phMAKu
         h1o1hrspxFqY5q/WUcughZlWigZb7lYjfCqNy6gfBvsVfeYX0llD5jRiv17f0XOEbxo/
         YTxYUHzRegCUFXp/IhSqyXkRqAXReSrNbLiH8pZ4IX0GcH9LDs75aOaOrfI4ZNeWOk3T
         SAhYe5TBcN+1F4qU6DDo1ofNQ6ixLF3YSplLHY9Ic3DFp9mzbIEgIOYmkMY+pePjW655
         nrig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gawronskikot.com; s=google; t=1795707802; x=1796312602; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVBNrja65i2mnM/VZ2gi4jXTrddpp+cofp3jUQSl1UU=;
        b=CaELDjHEuaO0xMKaK3Rb4JFOpbojewID/wM7mSN3sorBx9/IvUyuW+K3pCOUcbd8s6
         7praCwCM76dWzmfLEE6oVe+A9vm93wcBhyYw+wUc0UCDD2yn86o+5wvqDmm2Gj8N5zfx
         /nYJKEcFo4qr5pmCntIuQhx/oSkpHzocABaUx0NynKFGL9qEgL/zKIbLqcN1hpF2oenf
         tBndy1QfxsrXFQXcSe+d5I+sVMyZG1VWcmeaAo8DNDwAka3XhWzBEa3u9A94Bf11M+2d
         +yqIp10XESuR7mK1x4i/VczXu5gztgazEZkkp4oVoNFBHM41nnyRqHnWsmZVOdkJvEOw
         axhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707802; x=1796312602;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YVBNrja65i2mnM/VZ2gi4jXTrddpp+cofp3jUQSl1UU=;
        b=RkcFNtbN9Oq40MmEORrdcMDa17vX6oRrgX7xEyNFC0WWT3Nqv/XWwKVAhwkWd4Xgfi
         TmZeNwpjp2UDHABgOSNdleqK1TSu6qKJkGeXaQhFiJVpUsKCWgHu8WBdh3mxaPNt5MXq
         sZalRLOXy1rDd8i4kU+9qZ13SbZl34ypHLEuakHHHK0+DV9d8lg4688ZUTBX1hxNH20A
         n9OFEFJsSKwhzJBE0Gww3QXEBu+h1D+fP4CesE91ao3rLN1BfRV1Olo3SFTlElNaJX+8
         KhZ9hChjeOJKhs5VnVgblwJ7WJO2znWe2SlChgZITYUsHTPbRzyWM1xnKWzu4fGD8NKG
         GOWw==
X-Gm-Message-State: APuU4Z+UahAMH+3bBqVcNtI8z6MBb0XTzwGhIpee20bUkiPJGYsQNaIf
	xpN1OOmBLbkPzJnOlE9wXdp4Ti+YQuXP381789nN+w2JjBWOv5pA+FDA4QjM/4kmkZdqGXp//uP
	dE0VpUZY389EfiK33+kS27/mPMAKGlAWufsPOfaj9JpXAorqAxfNXAws=
X-Gm-Gg: AZFdTZejOG9pXKyex4u+5w8o73OlmdwTEgKPb7d9CBHOig1Lfxo99bPoRR5fw135tm9
	TTjUJeYtp7dEiHBgZYLTBgeGnyHRe5FyejimnC3z2OYUJJePf1bNiZfkClz1d1R6hzhRpV3xQtg
	twlJ81PcE2k7RkPbN5WSmFh5dfxF2yp30+UfBZ5EGpRjUBmMnv5vD8sPuPdvisAvm/RCERO4Dyr
	32manUlU0ed8c3cJpnOi/iv4gYqzG9LWJ2YBhg2VKtAu9+Kk2qyD51v0my6BJbbZoo4P9HetmHA
	qCpZ12E23d4RFNeWn7c7V56u+Y2Cd+3oZLzm5hAv3PfNN2f2fu1OP3mcWjlvAc9UUg6PFcPd2Zi
	3rhKvD7fkpG+rcOuhXFtV1tHOhK7gdX436UXkfBZv27kvOe2ONxFDDpadDMUaLpJpaQu5vhRdhU
	Lvw8Ae6Dnw93BmN2ysMctmW5UnBT+Jak8eshg6VxP6Kid+St1gcqdhu1ho92etwtHd0ChbuwZ73
	PMgDNeuAkVpqN3zWQZq8O/Au8nl58mU8lFURtYk/kxsalUzp4dGVQdGwdZOFIdqpg99QKUweEdL
	MAL5XkE/anfz6A==
X-Received: by 2002:a17:906:9c10:b0:c50:e9b4:3c9f with SMTP id
 a640c23a62f3a-c513a88bd77mr1335527066b.14.1795707801586; Thu, 26 Nov 2026
 07:43:21 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Michal Gawronski-Kot <michal@gawronskikot.com>
Date: Thu, 26 Nov 2026 15:43:10 +0000
X-Gm-Features: Aa3M54oIa4k3bEUUwLPG6-ivBxbufqd1bndv8PiC_gRZEkNuzcjeAT1KUni1y2c
Message-ID: <CAHLUh984ekPUaovVqrUaC7=6Uzf6kbRoYHqf26sj2m6raqGWOQ@mail.gmail.com>
Subject: xhci_hcd: AMD Matisse [1022:149c] dies during S3 suspend entry ("not
 responding to stop endpoint command")
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

This looks like the same failure as the AMD Raphael/Granite Ridge [1022:15b8]
report on linux-usb (Martin Alderson, March-July 2026): the controller times out
a Stop Endpoint command while *entering* S3, is declared dead, and stays dead
across all later resumes until the driver is unbound and rebound. Reporting it
because it also hits the older Matisse/Starship CPU-integrated controller, and
here it fails on every suspend I have observed with the controller alive.

Hardware
  CPU:    AMD Ryzen 7 5800X
  Board:  Gigabyte X570 AORUS MASTER, BIOS F39g (2025-03-11)
  xHCI:   56:00.3 [1022:149c] Matisse USB 3.0 Host Controller (buses 7/8)
  Same device: 56:00.4 [1022:1487] Starship/Matisse HD Audio Controller
  Parent: 00:08.1 [1022:1484] Starship/Matisse Internal PCIe GPP Bridge
  Sleep:  S3 (deep)

Kernel
  Reproduced on 7.3.1 and 7.3.4 (NixOS builds).

Devices on the failing controller
  8-2    046d:086b Logi 4K Stream Edition (uvc + usb-audio + HID
consumer control)
  8-4    05dc:ba08 Lexar Workflow HR2 hub with SD/CF reader modules
(usb-storage)
  7-3    unknown low-speed device that fails enumeration with -71 at every
         controller start, then stays quiet (bad cable or device)

Log, 7.3.4, first suspend after boot
  [ 6396.666196] Freezing remaining freezable tasks completed (elapsed
2.737 seconds)
  [ 6396.672080] xhci_hcd 0000:56:00.3: xHCI host not responding to
stop endpoint command
  [ 6396.672426] xhci_hcd 0000:56:00.3: xHCI host controller not
responding, assume dead
  [ 6396.672876] xhci_hcd 0000:56:00.3: HC died; cleaning up
  [ 6396.674622] xhci_hcd 0000:56:00.3: Refused to change power state
from D0 to D3hot
  [ 6396.674891] ACPI: PM: Preparing to enter system sleep state S3
  ...
  (after resume) usb 7-4 / 8-2 / 8-4.* : USB disconnect

Log, 7.3.1, ~6 days uptime. Here (and in the second 7.3.4 failure) the HDA
function on the same device also refused D3hot:
  [501011.853447] xhci_hcd 0000:56:00.3: xHCI host not responding to
stop endpoint command
  [501011.854012] xhci_hcd 0000:56:00.3: xHCI host controller not
responding, assume dead
  [501011.854325] xhci_hcd 0000:56:00.3: HC died; cleaning up
  [501011.854648] xhci_hcd 0000:56:00.3: Refused to change power state
from D0 to D3hot
  [501011.854940] snd_hda_intel 0000:56:00.4: Refused to change power
state from D0 to D3hot
  [501011.856476] ACPI: PM: Preparing to enter system sleep state S3

Frequency
  Four occurrences: 2026-11-12 and 2026-11-20 on 7.3.1, twice on 2026-11-26
  on 7.3.4 (first suspend after boot, then again on the first suspend after
  rebinding the controller, where the HDA function also refused D3hot).
  Each one was the first suspend after boot or after rebinding the controller.
  I have not seen the controller survive a suspend while live on 7.3.x. Once
  dead it stays dead, so later suspends tell me nothing. There are no USB
  errors on that controller before the failing suspend.

  The webcam's microphone is a PipeWire source on this desktop, and its
  usb-audio interface is opened from time to time ("current rate 16000 is
  different from the runtime rate 48000"). A transfer in flight at port
  suspend is therefore plausible, as in the hid-logitech-dj analysis on the
  Raphael thread. Not yet confirmed by unplugging the webcam.

Side effect on 7.3.4
  On the first 7.3.4 failure the machine could not be woken by the USB
  keyboard or mouse, which sit on a different controller (07:00.1, chipset,
  ACPI BXBR; wakeup enabled along the whole path), so it took the power
  button. The next suspend, with 56:00.3 already dead (so nothing failed
  during suspend entry), woke from the mouse normally. USB wake had worked
  reliably for months before this, and it did not break on the two 7.3.1
  failures. So the failed suspend entry seems able to break wake from other
  controllers too, but not every time.

Recovery
  echo 0000:56:00.3 > /sys/bus/pci/drivers/xhci_hcd/unbind
  echo 0000:56:00.3 > /sys/bus/pci/drivers/xhci_hcd/bind
  Everything re-enumerates normally.

Regression?
  I don't remember seeing this on 7.2.11 or 7.3.0, but I have not bisected,
  and the 7.3.1 stable changelog has no xhci changes.

Happy to test patches, capture xhci dynamic debug or trace events before
suspend, or try Mathias' debug_hc_died_cmdring_race branch.

Related
  - linux-usb: "xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 ..." [1022:15b8]
    https://ratatoskr.run/linux-usb/2026/03/8893441/t
  - bugzilla 221073 (Strix Halo [1022:1587], resume from s2idle; similar log,
    different trigger)

Thanks,
Michal Gawronski-Kot
