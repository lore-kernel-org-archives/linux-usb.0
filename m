Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D9B33F5A3;
	Thu,  2 Jul 2026 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015243; cv=none; b=Tn4Sq0kF3kKgJnAi/QSpCwFZznhYtwRluSqTmQv0gSy8Ro3jggFsEcBe95NpFxciHEBzypCLd8uOXw8AjhTLFT0sr9ySCPb4BKrfauZKhqdhx0EVYrOQZ1RosI7Y5yFe2fCtM0XsdyhTBK4/FF/fMT39NfYAXFTnhoLFAs4AQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015243; c=relaxed/simple;
	bh=81uAQatl5Nl0YNAIsvEn3//lHmBMS9i4BFnmP8wt9LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fl6s0ZUTSbL0lR8U6LBScvW7VDv6fj/8dpicV3cRitQXzszyUPqdROxIzv7VBgVvcXFw6NREVgOzX6gcbYo97+o+N3CIbjPsjvXQrOKNKehUC+35gZ2UnGpeqGukFoMe6hMBF1L+B/OzKxkdb7YhCaTP1hlGdboflWF95Qrg+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Eskz2zrs; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Eskz2zrs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xebSVH9btvoOA5wd7jjkFogUQ3KfJvU2qpvSEydg5Yc=; b=Eskz2zrsAbkrle95IzFL6WFPYp
	vzn1wrAtXWwesXNsY8DQ6r1kiiuT9A9+DV5hhILJE/ps4aaDJ1Gi8+h6lU54Qr0wxF50SUu3ar2R4
	dIKbvO1KKyEoyJvW7xVkbL+GZnKjEewoBjNGrWgvVKLEjKxQq10zMdcZC02VOjJgIIPlZIb1N8Hiu
	JzXUv1WAgEfK6+Xf8Cbeceqzcxfkk03qW43BZ5Qmx15pzN5Q9LO0B6/awajLOwQoCONl9bsdrNS5e
	jOJ/VamA0aB47VHoHD566MtaJ3gdB6MrwoSTmgUl8X5o7VYBZWgWzxwsFHNZxGd6AIlrfGUqsgaDW
	B+rHYTrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject:
 Re: [PATCH v2 0/2] rockchip: Fix devices suspend freeze on RK3568/RK3566
Date: Thu, 02 Jul 2026 20:00:32 +0200
Message-ID: <9647226.A5hrfCrGMc@phil>
In-Reply-To: <20260624192726.781864-1-jonas@kwiboo.se>
References: <20260624192726.781864-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Jonas,

Am Mittwoch, 24. Juni 2026, 21:27:23 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Jonas Karlman:
> This series fixes a system freeze during suspend in ohci_suspend() due
> to clk_usbphy1_480m not being enabled when EHCI/OHCI registers are
> accessed on e.g. a Raxa ROCK 3C board.
>=20
> Following pm_test modes work on my ROCK 3C with the missing usbphy clk
> refs added:
>=20
>   echo N > /sys/module/printk/parameters/console_suspend
>=20
>   echo devices > /sys/power/pm_test
>   echo platform > /sys/power/pm_test
>   echo processors > /sys/power/pm_test
>   echo core > /sys/power/pm_test
>=20
>   echo mem > /sys/power/state
>=20
> Changes in v2:
> - Include rockchip,rk3588-ehci in the EHCI constraint
> - Make clocks prop required for EHCI and OHCI
> - Collect t-b tag
>=20
> Jonas Karlman (2):
>   dt-bindings: usb: Add Rockchip RK3568 compatible for EHCI and OHCI

it seems I wasn't in Cc for the first patch, so can't know if and when
that gets/got applied.

Also I think I remember Greg preferring not having to split apart patch
series', so I think the binding patch might be better off standing alone.


Heiko



