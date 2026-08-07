Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87DF379ECD
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786128538; cv=pass; b=MsfvTH9Wr/Jt0oAbpDOgIAMiPrxMT2oz6b8ERJwXbYRrKSM915nt6iWjhadm0v6yIBefXxUXtn3xQTH/8tMmmGCjHC1DUUgvIsEAP00fMEWzqvb1i9qEM0XpOd9CWem8y6IWrOAAyhLwA0Z/TwSXJBs5aBYPTAtkDo3op9oosK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786128538; c=relaxed/simple;
	bh=K/AYQ0slGtGh2aGVAcbd5Ml309uD9bp7iupPakzq76U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cX+0RL4D8u3vHCAgyp7bRTelKIjiB1ptdM5rr0U4t7Dlw+3lwpEsPLI2PQL2+46op3A3XiKC8Tqk5ePoenaZZLxQv+pQsZNG/l7Bw1AltraU0hTnS+j6FeHvKi5qjWMDKglh8TaVzYKA1hxswFks0NQDaa061YoimrTUWYQF9F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMhAf9U6; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMhAf9U6"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73a442f7cd3so2298704137.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 11:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786128536; cv=none;
        d=google.com; s=arc-20260327;
        b=q+6BDNWj9m93hVnROLUP7Z7xoamzhKBNcNRe3OT8xafNYqAZF/UR0kMxs2fmqngFfn
         BeGhlRc4MIz2ZCUdflSSmSbOAhcdLf0iI2NsdvMOgkT9AhjZEkKD+qfDCzA2Sg+W4gRp
         ++qeqqs/x0r0T9Zj/GL+tlsphFH9POknTq6fPSN1fR7pisjCNcLP/ydW6wH+mILqYijr
         W9EC3/056h/dt0pAyv/ymwAomHi2jOgHx2B4Y7mv2GeCNsLPNbiEJvdqtYE5pNF0W+nH
         V0J9sKE+k6RtWDflJwCvTIWEH3S5RLG7dtKpIDn1IdbG5dnWGYh1eT9MoolZ+TMzXK1v
         7kxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KQbEMAEah3Uz8h1TWdBCzAeaWUqz5MbVi1G2fYGojfc=;
        fh=OUmjrNCjjr5IbWxb2ZU/0bvA0x++PeW2Y+GclBAHbOE=;
        b=BQbyGMCjItvM4leJZ7iVZkMZ0G76tRlX2HuyA94Ec/+okb2juixArOSZ8ie9lvRfLI
         uPQToHK+u+7170Lc6osufMzn7K+Zz94NeVWrY1qKQdiSY5cKSGVuToEsAS+hsl9a5mxY
         Igy6A91nXWKt7ZQk1DiyAJpduHYzF2qgf3ViAojApIrIGR9ft3gKyLFg22hIPBnVSeCX
         TR+b9ylNPqoP0i2w1ajebqOkJCqZfnLeuUHMBHc8WXvfCqchS7C/oHJ7QtR5ryswfbJi
         0qr0/AHv1WYMJipmt69xj0pjO+Y1YhKkzMQITdvZT8mZ/yiMqRlxL1G9SjEs4slDqx4c
         ufWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786128536; x=1786733336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KQbEMAEah3Uz8h1TWdBCzAeaWUqz5MbVi1G2fYGojfc=;
        b=JMhAf9U6dfKednfqd8dtBUk7canj9LAv/awGpDra4tmFHbTMPNxvWLr/DfJrtG8c97
         9hJVeN/TeZyWUTCIuV4DzT24pirlbAMO/6d8LUUcbTE9+CYJPFNGg1xbXIioOU+s9ivj
         6bGpOZkeqm5/IUdN8B1ppTs6+LHS1etEvWyTW29++Dnp5n+aSsJ5pyATaWiV6n78hTu/
         YahRabBsWrv+w5ZXW0J9Ihb/iTBVpgb68gfubkVhRkBwZ/X62EsJRJAh5M9HJqONTCtl
         oTArV8811sAguAjw2X8utuSMXJjRog8tEJk1fSp0tHgQk9fC/yV+xGrrin3qMktPmV46
         jSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786128536; x=1786733336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQbEMAEah3Uz8h1TWdBCzAeaWUqz5MbVi1G2fYGojfc=;
        b=eySK9H3WtycK282aDhfStf1ar/GvnS0xke3yuyjYBGC5Vwz+LfT8Z7UR4WcNis+Sok
         9AsGvBSAN3aPtP+e8Cd40pkoZJu6nioBSqiwO0swWuVSfGP3zj/2Cl4YFi0o8seG11De
         nl5rOtybeQvdHC7ci2sLuuoAM9SgRkuNvG5gN44Q7PVofXr3KWxYSD+HxA3dF0B2FiUI
         4BNZsTEPGrNVF2AQX/unN3VpYU6pDIawR+gwtmvzkH6tsZ5CBYIcGWQE6cmnLyHTWYR9
         gsD7MG+bZqIKD52HMOazWipayAQNliJHQOGGdaBsy4OkXNjx6cU7W2+mWS479844yZ9G
         7R3w==
X-Forwarded-Encrypted: i=1; AHgh+RpjKnHoajTzWa60F/G3iVMn8c3m7OoN0oH/u3C9tkpH2mF60JtD7HSexNgBvDtyndRtNeMe2i64R7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhx6cMtpU16WUSYokIB5PT+0e8mnUIV2PIVrzxyiA4zlF890OV
	jHc++Y4fO7wfoaInvSK3Fru6jMuZiQoEWlX8cfUiYvmEOFCiE+dDaCs8whp+q2fbGCex+Wo+aSk
	6ggsdxvoyCgNXUZ/AoAw786duD88J/IU=
X-Gm-Gg: AR+sD118HsA6DtJgbqeeiwtuNyh/FnjKGgkSiBVADZJrzm6/Vc7hVE3R1WVTvpEh+b5
	26AHHxlSUimWyLW3Mp7uA87KVMY1vetHYSIYE4Ku1bOpj0lvJ9FqqP9dmgdDV7wUlpaHc2Zh8kE
	QXWfffrstalh9x0EUcPjuIeiO7qbB4sslKMmw0yWJ4dNimervhr7lmiBgs0ZZq4lVL7D1vXWQOI
	2SFRetkNdiQZhEeAvSiPO7L1np7eLpVALWJ6/G7N8MP9HzabNIbYTrVriedKb0qe9AFpirM/es8
	RdS6B94/JsY7CpZFikdoJQBTvDP+pJ6ZP4qQgYL8x6092+1vzJDAnghtLyCnPJeqbFDdq/E5oRn
	BP+n79hKtX074GxQqUZcxLhBLa4yeWPhWDVHngym0XeXM/mLTACfAFaa+gnTRw7k1OFrhmncqRe
	crjek+GfCyp7mxQBRf6KfIrXFV7hvooepxYXTTFQ5yCgxHIWo=
X-Received: by 2002:a05:6102:41a1:b0:73e:9fae:5845 with SMTP id
 ada2fe7eead31-764e1c5f6d2mr939262137.0.1786128535635; Fri, 07 Aug 2026
 11:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch> <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
 <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch>
In-Reply-To: <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 12:48:43 -0600
X-Gm-Features: AUfX_mzkWefaGr-yvRIWAT7-WpS4J20YFg4GvupbZl2AqZK75NjTjLSVgtv1IY8
Message-ID: <CADvTj4qrYYA-e+9iJ+q4UaZteUjpypRa6HBSmwp-ajwPbwYERg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 11:15=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I guess it can also be used like this for live dt modification:
>
> A guess is not good enough. Give us a concrete, in kernel use cases.

I searched the current tree for callers of the OF changeset and
overlay APIs and for OF reconfiguration notifiers. I did not find a
current in-tree path which adds or removes a child below an already
registered MDIO bus.

There are concrete existing kernel mechanisms and DT descriptions which
could become users. lan966x_pci already applies an embedded DT overlay
from a PCI driver, and the FPGA region code already coordinates
in-kernel overlay application and removal. Mainline also ships overlays
for TI J7 Ethernet expansion cards, NXP LS1028A QDS cards, and other
boards which add PHY nodes below existing MDIO controllers.

Those overlays are currently normally applied before Linux starts, so
they are not present-day live MDIO users. If an in-kernel line-card,
mezzanine, or FPGA manager applies one of these topologies after
detecting hardware, adding or removing the PHY children below the
persistent MDIO bus is exactly the operation this notifier supports.

Likewise, a driver which identifies a PHY or retimer package from an
EEPROM, NVMEM, or firmware and then enables the matching child nodes
would use the same mechanism. The kernel already uses OF changesets for
analogous late hardware selection in other subsystems.

> > AFAIU the patches other than the last one are still relevant regardless
> > since they are fixing a bunch of generic mdio safety issues in code tha=
t
> > has users since MDIO maps already change at runtime through non-OF
> > paths(i.e. SFP insertion/removal).
>
> Fixes are fine, but please word the commit message around real things
> that can happen in todays kernel. If it is a race condition, such bug
> reports often show the call stack of the two racing threads.

After auditing those paths, I would qualify that statement. SFP, AMD
XGBE, and Airoha all modify the MDIO map at runtime, but their known
paths use subsystem-local lifecycle ordering to serialize removal and
attachment. I do not currently have evidence of a reachable race in
those particular paths.

They do demonstrate that the MDIO map cannot be treated as immutable.
Its safety currently depends on every producer and consumer arranging
compatible external serialization, while the MDIO APIs neither express
nor enforce that lifetime contract.

I found more concrete current interleavings elsewhere. For example,
PXA168 can scan and attach from ndo_open while its remove path
unregisters and frees the MDIO bus before unregistering the netdev.
BCM SF2 looks up and removes PHYs belonging to another MDIO provider and
can observe that provider while registration and OF population are
still in progress. GENET ACPI and Davinci also cross lookup, reference,
and attachment lifetime boundaries.

> Do you have a board with an SFP cage? Can you test your change.

I do not currently have an SFP-capable board.

>
>    Andrew
