Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA02D8379
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421468; cv=none; b=ZUldNpjTmYWUrbRVfUWG9zgA6JI1s5gvrynXumXzqeulyyxGDba/Rdv7z0ZUy8CwpYMr9rJ5TbxFGHrrD2iBTEoEUuYrEep/8mPKIkPGAbRJTQj5b7deSzpLdPI4tzvnZ7DBxKNsK3Zc5uIKwRCf4IDQIO7SQLYUOgLtALT2VyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421468; c=relaxed/simple;
	bh=9VrNYSCb53PZhoI3LVUllueRT6zUQCi5rwAda8FBJ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pk+MebyxaqSRboffsoV5KVk7iVNFHPL7nahfexXvAI50thn5iShoKyHNrEs2VVyey6CwTcLrymYYGAdKuGoL551D3F/fZHTZSweYYg0JECjHjAEEm3ZJyMuFJZEueXshApad4KnGUajpb0sJTxfLwMxgVODHwrM5RlNhKLnLUjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIEESFHF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIEESFHF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso26442275e9.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780421465; x=1781026265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VrNYSCb53PZhoI3LVUllueRT6zUQCi5rwAda8FBJ7k=;
        b=eIEESFHF9anTu+5RmBO5gm4e7mXkvg4m3R8QGLLDfzdRKWhJlax9b717egzGhAFioF
         WjuajzVWopgutelDwyOoU3ySly82+AudNt4As2WDplKEgd06IbtwEeNLVRMSnGNIHQcF
         hYy8xVQ+UcHdMHvI6ef5ST/iTKjIBhEQnVKwyYvbNuauiLfyEURqHrqi9lCbXEDgOTPT
         CJ4BNsVyTf8frVTg6DtUNBsa7ttWqrIv9rGStpr1b1GqTBR1k6/UxUan7C6toHjfAZXo
         8Cu8523A+4wN9AjQpScSWqH78CaHAqivtyqVxx3U3bAmvdlUFy9CzGRK4Qw9uoW2mwUF
         NXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421465; x=1781026265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9VrNYSCb53PZhoI3LVUllueRT6zUQCi5rwAda8FBJ7k=;
        b=ExZoYNujgjH7QJAgn+VcLvz3pHhc3x0IGp/1t/v1iGhR4jq9d/CUdip4DPtUU3pA9y
         dZhW652dArW4BQsJx5l8D9ZxJpcSUn+B8FLB2sQMgAXKRXH0rym6EITEnlIb1jYBZQ7P
         v63FkgopM79crA20ODPyBdsgn0p124FAAKMfRfL/exa9SRv2wAZEoz2CuzunSEpIvvHI
         HtPt4xungvqt4zSTBXCGRBn/JNIz2mNVn5NTOkjZ5YOHDEbiU0qNvpdIPgSYzhoxw6nm
         I1qT9h7wTpGFKvD4/8a0c0WAtrTG3uyXBJktSWryKkwKCKLuRu7Xg4ox2TwfFFbF4MH4
         nAkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+M67i7upUGedDY3yK9FtRUFlx0hUZdpRObuDm6uQ1/4oVg4UsmaT5M76GAJXqKGPawp792CeVpSLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrb1LLeVz1l8MRnLA2E9ouFRuDLWu81HzbaUC5+2ctotXJKGGQ
	EHQuFw8vjrmpeSIuAovRK+1EmtgnjkyzoIxiLGb35pYK4n0xOdlbWcNb
X-Gm-Gg: Acq92OHqW5nHiYhSdHZSZcI5eFgGt8qFqqdRtzXFFz4aWlZbxhGXxKiDIboD8KV4zuI
	FClzdFWeFt1fZjUe5YXFpSqKUtW/gzq8dKkqKZfwzqNJn1dXfWaojkXdch6sliBFq503CeAoMfC
	hrTUGQroctxuvHmaHbtWIQyiRiPco8Je6R7FTIklHzoYpaH7pUH2MuS51BLYqvG20IVjrPkAp8e
	C1vmS4Zkct23vdrY8rPFcxu0XWXaETi044cdSovapA7kmw+mca17ic+K05lxpzf0hi5pNToRhHy
	C8dojSGOE9xvf5GaM6vHppgdLVhFfUbro7vUvk2ksnOq4O1SzuxNHbb/jfjLhng6B5+zt9rLDy8
	+JOHCe9BMRz5qAPg8R5Sq1oBSxpJ5mJxpHveqfje/G94FCDNyy3hirIzskTEDBBmaQ9R6aoSAVG
	4gsEWpDX2oJTfFkGQXnMFIfW7FrI2cwM7HCSkV/xLAT/9o3Q==
X-Received: by 2002:a05:600c:1382:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-490b5058707mr11996305e9.12.1780421465401;
        Tue, 02 Jun 2026 10:31:05 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b56bab73sm954695e9.34.2026.06.02.10.30.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jun 2026 10:31:04 -0700 (PDT)
Date: Tue, 2 Jun 2026 19:30:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
 sakari.ailus@linux.intel.com, katieeliu@tencent.com,
 johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
 limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
 vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com,
 bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration
 descriptor enumeration failure
Message-ID: <20260602193047.5fe03b8d.michal.pecio@gmail.com>
In-Reply-To: <CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
	<20260531101612.332151d8.michal.pecio@gmail.com>
	<CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
	<20260531123843.736bd69a.michal.pecio@gmail.com>
	<3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
	<20260601084846.433bfc51.michal.pecio@gmail.com>
	<CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Jun 2026 14:31:59 +0530, Nikhil Solanke wrote:
> It didn't occur to me before, but since i had a patched kernel which
> enumerated and initialized the device properly, i was able to do a usb
> device passthrough/redirect of the controller when it is in xinput
> mode. I have utilized libvirt for this purpose. I tried doing what
> Michal did by using qemu cmdline directly and specifying the location
> for pcap file, but for some reason the pcap file only contained
> request packets. there were no response packets.

It may be a QEMU bug because the same happens to me when I pass through
host devices. The full trace I posted was from a QEMU emulated device.

You can also run Wireshark on the Linux host and it seems that QEMU
forwards all control requests unmodified to the device and Wireshark
records responses too. But it also records some additional string
descriptor requests (apparently originated by QEMU) and any random
traffic on the bus to other devices.

I passed through some serial dongles that my Windows had no drivers for
and I found that it only issues two requests for the device descriptor,
one 255 byte request for the configuration descriptor (possibly another
one if configuration exceeds 255 bytes, will try to find such a device)
and a few requests for string descriptors. That's it.

The other junk only appears when I install class driver for the device.
And I still haven't installed Wireshark in QEMU Windows, but it appears
that Windows Wireshark only sees that class driver traffic and nothing
from core USB subsystem. So it's useless for our purpose.

> I have attached the wireshark captures from the linux guest as well as
> the libvirt xml. i also had tried using ehci/usb 2 on the guest.

I only mentioned EHCI to ask if any of the hosts that you tried had it.
The point was to rule out possibility of xhci-hcd bug, when we still
believed that Windows issues identical 9 byte requests on the same
xHCI controller and somehow succeeds.

Now we know that Windows Wireshark traces were misleading and the use
of 255 byte requests likely explains how Windows enumerates the device
successfully and Linux fails without your patch.

Regards,
Michal
