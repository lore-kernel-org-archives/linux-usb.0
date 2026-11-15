Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739918;
	b=iMLbQpr7Uo5GwuD+vFxO/8nqk1yJ0CsHd6QGZ55X+P73jO/w0rMkBkUBH8FWeT+qA+4/
	 /okWFSiQ8X/CrOJ5u9GDK6FjKCtt8+j/jlcbIU/ntphB/CVF8T0eOS2Ypj7a8q2apHlLD
	 juExFT7R84rIiPFgxPRgo5e0QrZytdFbvv1Z0PVwTt0O7HGU0ceAmFRigq6/hPgGzpc+3
	 TP9M65vF0bXUCWp+qoVpD79lEd5EEBY4Th7ewLoGy97hxlB0h4u6g0LnhbovGGtDlWC/K
	 8l7gY2vNmsX7qC6HzCYyG5nFT2MIi9ldyDt0yPiBpTx58GoHW9jiCpNjPLokGYSyy9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739918;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HGtAYAUJjMEYUfQwWitY0MieAGsRBREtW1Pz6xF1K0s=;
	b=PFORnLD2I/DOB0R6t7SWgi6O2rI3aGm6RlfnwyqvtyPZPsJnW6zYjjccO5Rf69Eq2CNu
	 isAQmTFy6TIr+41aVB+T9Zq/zQYMYdf6FLpDE4tao/326vTJVxrmQPW5veocPeMwGCRWm
	 ocyv6uPEwAQ9QzD0bETMEMj5B5506QHqzzWZaD2er5vXeRouDJ3x9zKuukK8NF+aP5ktq
	 kkr2bOiKj76lmSYYQnBGIATGP8UgoaqcvEUruBRuXYttJ8X3jRXVT48gkD5+xGpXkRn2D
	 ppBO79L5knsQoNmcG2Q/YmEF+Zxp5bmBUsI8sgZuslkipr80irR+h/DffXleEgFxnWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lszdLCf6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE2606A336
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lszdLCf6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0431F000C4;
	Sun, 15 Nov 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739918;
	bh=HGtAYAUJjMEYUfQwWitY0MieAGsRBREtW1Pz6xF1K0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lszdLCf6qM1l7/HKKUcrczuMHCJ5pHTOFNjqTHSw7D8jmYfoiM5R0Dwz8TmOGeoTz
	 iRBbi6FaJKccuemmCHmx9VLOeJ1860+31LenZcjlDBliuApbGdwWNtiywig+x+LBB4
	 eKwuB/5IBQ7JlUpUIV9wGha+imh/jnxj6961AeOZIMabL/YM5gZtNJ/UVFRR2lXIof
	 9dG2DJK5Jo0NV9HqSDPYJPCuUgZmvhFJUT6iq6Vt8fAgCpC7m5h3UwtwZNdEtEb33e
	 SWq+uCCghXbhSiyikdfcxmMoKKjzGmt8G7S4eZFZMwIjok2PXAnyOMgpxo78bUJRqI
	 kwEoqGDyusLgA==
Message-ID: <sashiko-outbox-215424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 11/13] ax88179_178a: Update driver name and
 information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-11-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-11-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: usb: ax88179: Kconfig rename drops default y and
  disables driver
--

commit a2dd9912da623ded3490ea8a07a91779c220769c
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Update driver name and information

This commit renames Kconfig symbol USB_NET_AX88179_178A to USB_NET_AX88179,
updates the USB driver name to "ax88179", and expands the Kconfig and
module descriptions for newly supported ASIX chips.

> diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
> index 115990b0d9537..cc8f2e1503399 100644
> --- a/drivers/net/usb/Kconfig
> +++ b/drivers/net/usb/Kconfig
> @@ -195,18 +195,21 @@ config USB_NET_AX8817X
>  	  This driver creates an interface named "ethX", where X depends on
>  	  what other networking devices you have in use.
> =20
> -config USB_NET_AX88179_178A
> -	tristate "ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet"
> +config USB_NET_AX88179
> +	tristate "ASIX AX88179/179A/178A USB 2.0/3.0 to 100M/1G/2.5GbE Adapters"
>  	depends on USB_USBNET
> -	select CRC32
>  	select PHYLINK
> -	default y
> +	select AX88796B_PHY
> +	select CRC32

[Severity: Medium]
Does dropping "default y" when renaming USB_NET_AX88179_178A to
USB_NET_AX88179 disable this driver across existing configurations?

Because savedefconfig omits symbols that match their default, the 25 in-tree
defconfigs that enable CONFIG_USB_USBNET relied on "default y" to build this
driver and did not list CONFIG_USB_NET_AX88179_178A explicitly.  Removing
"default y" alongside the symbol rename causes a regression where
CONFIG_USB_NET_AX88179 defaults to n, disabling the driver in those
defconfigs and when updating existing .config files via olddefconfig, while
also making the "# CONFIG_USB_NET_AX88179 is not set" overrides in
loongson32_defconfig and loongson64_defconfig redundant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D11
