Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612073;
	b=0wYvhytF1WTWdXjxjIT7/aU/t3bd8Hw9RfpHg3Atalo0M3zWgUSsjU14sKcfdzFZOFvB
	 QfJenkvpMC7RbAQjMdawF4yykQq1DI04RBH40PPWxU8uwlREpHatlnKEveHmAOwrvVHxP
	 +gvt00czvxgUSMV+E/0Y+VRlS5Gaw5xBax4xsFlOM+KPGAeWrJFNVn66aqo3GkmZIjs5v
	 F3BKqamaTUahPVP65sERYWZ0+r/lb4XYIGb1CfEPmB9iK1rZDaRa8mmzBOXGALy4KB+A3
	 t4KgCr/Xq1/fVwCX8N1AWMP+qBH8y8CsqiGMVD6FSqyQ8dIjcTQe8yKljUcuS2dSDzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
	b=QYg5gGaifBIwnKjRImqLTcCpKGevKPKjPFvyZgR2zGov7mnUXEUdOAjSZA0Dg8ssIIbd
	 ZKG+pZqsdmbUUOAa3q2oCNnOZ4Oztoh+CmYLxYW3gwVzWeDo14HNWvNGhFZRNOgF2g1Un
	 A1LVBkmCE2LJH+lORCdoNTEmLzwhWucXlq1b4YtJsEo86KGCZER3eTkXYNuFsjAe7tIyH
	 d3k8KvfTcMFJ5vUhtEViuYyMA8rh8JHl/UfAMhSmbUht32nZMpsDjiXeqH30OcP0CaDnc
	 qSMDPZNw8h/3UV8fCfmQUu2U+zF0PXoHeVK7YCQq78Vkr9HgbNLlT4gq+uY+f+u7HoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AE7606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43AE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik9OkEdc
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5063067f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 05:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612072; x=1796216872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=ik9OkEdcz0lBWXP3zQhg/dxf+nRVg711ZuXBfy+HlYOb4kDY/FWHt+10HsOpArGfZO
         jBFqyB5gltkyarPZ01Xe5kl0v8bzel/Gg8iEMWoV7BwjCS5TYn0pM9bnJfiHRGXj/avE
         bc+JduR5pBXQkWa1Xy7BJtVpywXMbOZADSRkJ/XSgrsKc0WCLmOoD9Pdkx/eFtZPeUnr
         FJpcz0+UhBz64iLV+IXJH3d1g2jXf8G2PxJDd5XpQCGI+ZPSXWRvUYmoMhk0mFJuGapZ
         oP3pZTC2N8D5VFtECpr3nPd5IkufySQfxXAnDB8RqyYAh/4XhcxvpOmaAUdM43nAcWfs
         Vuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612072; x=1796216872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbxzpWqwrRbguc2ZFVrHH2aoPrOKmuVFWoTJw1eHSIk=;
        b=Xhs5IN85NFCeUgOo/yiiIHfP1F5VtnlLKlptxsyi/M5LEVvHAvppY8J2HfAyWaqb6b
         RDQeVGx/Vj0mAoXEOeDpGduMozqa+jv8Am8ZkcBIrXipxtWb0A6MeRYJpX1HJcq6rhew
         GMgWJxsPhmX5tL2V60Wsr+WMOPdTgqNCzxwZZCjsvkSGOyMMBvfzdlFKmzKNUPk0GQsZ
         YQ0SDlFqOKtzJwUcyuJ/1yIdlJ5FbdRDD9HN3yO6sllBu/DzSNWQEvZgeBIgGo5e0ZLz
         Gj2qARD42PqIxepE0UXA8U2KiHHYC91yOtwHoOo3tmxPs0uH21NnypuwTfW3tby7VSS2
         x3uA==
X-Forwarded-Encrypted: i=1; AL+hErFAl8MbOfWFs9iqaKaG580tQotuPBQK/QaySJ5tjSZTOC9EAk5x9CaSy4xYrLbCc2PPBTdxWkLtVEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ua6bYDdU+mnOf3hSy0oCWRP489j+mqkULCH2XrBuA0oM0qq6n
	8SSnI801tC3eMdW0IFREbZBSKTZ3wmuO3Jc9pGDb2HFHEB9NFi13scyR
X-Gm-Gg: AZFdTZfrC25rbLamnOlUjce60GSJCPt4OdVJAoeAeCbyDusQaVXXm5SY+Dv4FNHj70P
	ZhZbF/iWwfuWOhUtJZjhGa+vVJIxF0nG1XF3zVn3+LW0dCJlFX242b00k39Wkn+UX9S5kCVYMoQ
	vtbYZQ3sl4d5/ydvRukLYmq2Qu6w5m4+Z36mXLYHrOQf2ubAH6/wXLOeZsNeoa7IlJgUH5jjPj5
	Bs054FK0xCfuVaJWqQjKKUp5+WZqOrOwLpGqKM/Xe0XCk8yrEo1DanB+8pQYUXar8QcWxo0v18/
	sZOsDqLWTqVsblp3lD56U5vxMl4yC+XdER8tbruybDG9hX8aNc5sMXxmxHQrNWQwQGxvgeQR+mI
	gjiEPBtJwcXclOQFr9UAwI//+xsDeC6f4qxapdW9VGlym1fXBohrdceJyuAiXO++p40N8HROu/g
	dkjDEJltARfuJd9k++Yg1tpPYQIpP2nBjicz8cPI2UqAJixgjgaDMRtchtV5GesDn4n/PKiy39D
	KpbS0KZOVdt6AWr4R5msLv4rqiiMFZ50xwhvqw7r9D6Shc4WqHIVdjMA4L6G7LBCYXdbtDh5Uez
	5WopBDMcLLXLXk5ERfsxtigIdCbfZ3/xgyy6dLA950Ap243ZaIuhDZ+oihHTsWi8gQJuXLDv//g
	9wQRTXJgkdwtjrehn3JnaL+Vuc6xN
X-Received: by 2002:a05:6000:2089:b0:4a8:647c:f963 with SMTP id ffacd0b85a97d-4abb964289amr35929140f8f.51.1795612071506;
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm33783108f8f.37.2026.11.25.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:07:51 -0800 (PST)
Message-ID: <4ed7e2e27c221ab900b1562c2a578b78c3c663b7.camel@gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Wed, 25 Nov 2026 14:07:50 +0100
In-Reply-To: <179560526391.84329.2026344704407829230.b4-review@b4>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
	 <20261123092244.1792040-3-virag.david003@gmail.com>
	 <179560526391.84329.2026344704407829230.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-25 at 12:14 +0100, Krzysztof Kozlowski wrote:
[...]
>=20
> > diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > index 8af0143c3e47..f62e3ed82257 100644
> > --- a/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-
> > dwc3.yaml
> > @@ -24,6 +24,9 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos8890-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos7-dwusb3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos7885-dwusb3
>=20
> Why isn't this enum with the other entry?

I failed to realize that that could be done while rebasing the patches
onto the current tree (as 990 compatible wasn't there before).
Fixing it in v3.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: samsun=
g,exynos850-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos990-dwusb3
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: s=
amsung,exynos850-dwusb3
>=20
>=20
> Best regards,
> Krzysztof

Best regards,
David
