Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130003859DC
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 22:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377397; cv=none; b=UBYleaZ8djFaZRJFdjG1tLjPI7T/jTnK1sbFFU+cyvaMt7Xkf74v/U4WjBkMrzkXgaNFf2/KpLXQAm0E61H25VvsEzlSe8qqW8MCdnVxQJAINssW/vM3N0Sb2zvMaaddWAH7L5657UtSsW5Y6x9sa3+x8te+SJbVVKFohATxq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377397; c=relaxed/simple;
	bh=2LN/5lQtjwFoFJi2wThXMjSmoXvlWrWaPW/TfyPgkzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQ7V+dScX7bDK2ERtwSPz5Cy2Hq+ULWUmnxE489M3T4fZLWxekitJ3rQ45mUlSPVJqnwOag9c5Kk05U/EyaiE5bYNuFKkDdsUdN6nXYjUgxlu4y4EIx8dKvXAJkRUmNY+YCJ4ojzammgUb6jwgJjm2/0mGm4Zh3adiPzBPSx7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pi077ic7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi077ic7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c1950518so188695e9.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 15:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377394; x=1783982194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15lXngfbV3oHOC8Vn3lhHZSCcqaMFAt4guZPgjqF3Ck=;
        b=Pi077ic7EMhPGvFoyy9h2RYE0bLpeg2kStp8HXoIz5egG2tH93ZflRyjlE1VvnaHix
         nKOKLML4IXC+RqikHFb8AhYg+kcrZ2KwPsXjZtSM/9SfNQGZderyP9V6dGLBxS6LomCu
         mkVT4nT9anNqYq5bG3Gd0znWsG7O+p6o8UVaGZY1KqKpSoZwJJgUYpJ5DZM2pyCDACd5
         N7mQxnDzW9QPqhry8I4qozgfRxHJ/XW9s/7A/W7jwypDB3TCzN2EblrwV29VYaR1XwZM
         4oJ+G9W0+kBXN6S/9L5uDxkpddg2UCFs8lHiwExLBI25gAS/wvKwh+KqtFGJABzd7xhz
         apNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377394; x=1783982194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15lXngfbV3oHOC8Vn3lhHZSCcqaMFAt4guZPgjqF3Ck=;
        b=QP0CTahgzlS72esg6uG9X1Oqo76Qou/3aLjkXh5N21Tw57W7t0DzqjxXsqJnq8fkOu
         GrdbBKNd7CVgo07m2igNxwaLqerUizUMJof9NgIvkr6EauBZv2GFaTX1isRVdY2662zP
         2NVcODmu2VlIyRwSARCPs4Gi5Rcp3CJfK1JUYeWjO28xeBc0k3fQ7XvQgv/BxkM09ANW
         82vtldgsAeQ7xdrqcTXHkjpXkEJbQyTE6g0ejvZ/nxHRg8rK3fd7ZIAwKemRk42QVL0d
         +4y+cbEm0XTviWZf9y0VBVWx4b5VtBHyjLgScQB2tcExfWQaRUzWOZWOxG4VU5UiSic1
         1W0g==
X-Forwarded-Encrypted: i=1; AHgh+RqV7zphsogkXbztZhrrFqNgylfQVdmLsSDFSMo+L8+iVNgeunuRyL3y0URpFLIUmr8ZCjlTp2j00sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxITx+btHWdKu+6qkuNiazzSHN/OaCtCgLTYDjG9EKcb1d3oNeo
	xJnQTx3IG3H0oxLL4g+Xbn5C69ahHXqaBAVKcOUmMZetEIk1GXPBP3zw
X-Gm-Gg: AfdE7cko+EsuwaLhpCJFom58xY8/PCgDoEwm+TOBNfIYOOX3l7WorrAl3jzPQbGcIbG
	FzPsTteXzqRI6Ybw4sZzZ8x7rua0GgVpvay1pTGqNpyN3H4X1TXIjuo6igTiJkaIrBWreGQhUwA
	o+y9jQnOUPi0o6kg3NKJfyIRH2jtW4sIVsaoSJJg/UYBTtSY9Nz4RcsXLFHf3EC4EWZdTLzCG5P
	yle5C1183wzi0kExkpcLz6qvHyEoYOVJDOo8Ve8r7oA+qlvFBvRt67u04mxqfUwGvIsz7qh2e+f
	tM8G680tsmAwiI5Jc0RaoO9wzyxZ7NbNFJh2MtE9M9Dm3SwhJTVs9NY3KSdMHHkXv+v7S2/wYjK
	noiqQpbL0WVUsmeAH14mK25Ngb8G1ODvGO4YitQSV7cSvLRxNxK/vrOFLoZz7RH3hnQWCSeyQP1
	9ZXkP/JPI9XZoWmhaqRy+540WNevRK5nBzFXlFrqBxWiFDDABPbPJUrMPjDzuWaA==
X-Received: by 2002:a05:600c:1595:b0:490:55d9:149a with SMTP id 5b1f17b1804b1-493e104d170mr977625e9.18.1783377394164;
        Mon, 06 Jul 2026 15:36:34 -0700 (PDT)
Received: from turbine.fritz.box (p5785b224.dip0.t-ipconnect.de. [87.133.178.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm27491387f8f.12.2026.07.06.15.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:36:33 -0700 (PDT)
From: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Frank Wang <frank.wang@rock-chips.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Subject: [RFC PATCH v1 0/2] phy: rockchip: inno-usb2: fix USB gadget hot-plug on peripheral-only OTG ports
Date: Tue,  7 Jul 2026 00:36:25 +0200
Message-ID: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

I had an interesting time trying out the USB OTG micro-USB port on the
Odroid-M1S (Rockchip RK3566) on the mainline Kernel. My intention was to
set up a cdc_ncm+cdc_acm peripheral gadget as a hot-pluggable debug
port.

For the most part that went swimmingly. Just not quite with the
hot-plugging. The apparent first problem was that peripheral mode only
works if the host is connected at boot time of the RK3566 Kernel,
regardless if the dr_mode settings is "otg" or "peripheral". When no
connection is present at boot, gadget setup fails with a
"failed to enable ep0out" error and the port seems to end up in an
unrecoverable state afterwards.

I investigated a little as to why. With my very limited understanding
of the subsystems involved, I think I have identified some problems.
All seem largely related to each other.

* The M1S references its 5V OTG VBUS switch as phy-supply of the OTG
  port in its DT. The phy core unconditionally enables that on phy
  power_on. From then on it powers its own VBUSDET input, making further
  cable VBUS detection impossible. Also, apparently, after reading the
  schematic, that means even with a cable connected at boot (and
  peripheral mode therefore working), the board will try to back-power
  the host. Seems my host port is pretty robust, luckily.
* The inno-usb2 driver seems to generally lack DRP power supply VBUS
  switching support? At least PHY and VBUS supply are semantically
  treated the same.
* The inno-usb2 driver's state machine powers off the Phy in several
  places: on an initial no-VBUS sample, on DCP detection and on
  disconnect. That seems to happen unrelated to controller-initiated
  phy_power_on/off calls and looks like the main cause the gadget setup
  fails and then borks the controller state.

My proposed fixes are in two places:

* set the micro-USB M1S port to "peripheral" in DTS and remove the
  supply node. The board has two USB-A host ports, so device mode is the
  most likely usage scenario for the microUSB and real compliant DRP
  does not seem to be in the cards in the current state. Also, this
  fixes the potentially harmful back-powering issue. (2nd patch)
* keep the inno-usb2 phy driver from autonomously powering off when in
  peripheral mode. This makes hot-plugging and gadget-setup without a
  connected cable work. (1st patch)

This "works great for me". No issues whatsoever with the M1S in device
mode. I can plug/unplug/replug at will at any time, rock solid.

However, I am also doubting myself if I have completely misunderstood
the whole Dual-Role status quo and should have just done something
differently.

Also even if I am right about the problems, I would agree with anyone
saying that this isn't the "proper" fix for the whole situation. It
seems the rockchip vendor kernel is doing DRP related stuff differently,
e.g. an additional vbus-supply setting in DT with apparent support for
VBUS role-switching. Fully automatic OTG with gadget support *should*
be possible to do. Possibly a lot of work, though.

Still, I would say having a solid peripheral-only option including
hot-plugging is an improvement to the status-quo.

Host-only configs in other DTs should be unaffected as the inno-usb2
changes won't matter there. The autonomous power-off will still happen,
for better or worse.

Would love to get some insights on this from the experts.

Cheers,
Andy

Andreas Zdziarstek (2):
  phy: rockchip: inno-usb2: keep peripheral-only OTG port active
  arm64: dts: rockchip: fix gadget hot-plug on ODROID-M1S micro-USB

 .../boot/dts/rockchip/rk3566-odroid-m1s.dts   |  2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 27 +++++++++++++++----
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.53.0

