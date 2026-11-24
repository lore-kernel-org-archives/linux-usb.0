Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548748;
	b=q5BANTyg/ns63MhIzEYxBKStgC5cx4SfVfSYsWjPZgL+wxfnC/axii0FZW0F+tZZ9euy
	 n6Va5Oh15rmxOnPIzeIDAvLA5xSOoAPZQmx0HvGAWFLaXzS5cXUHyspVaABUDHz7gr9zJ
	 bnz9pbMssLEpTFjeCXCiOfVoU037lOLUFWDqWHqghCVyVjJznlratoun2qFxu7EbPpuCG
	 XfSQ6pkMOiwdDqFebKJLNaXADkokPDGrKctPxoTIA+vTPDHVqXyHg+zRWg2Ep4VwpxHob
	 jFUMVl7dE9LYd2w3SpDaZ6EfYG2GaxHporTtSceEIM3yw3/7hlcQXhRHPSBs2Sn8JIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548748;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=yd/6hanBXf9zEhrdANGKjJeIsJ0EIDRqYpFyzs8Z3FY=;
	b=BK/YVsInIulHwGIgNVrh5fy40jpZXgv8qIrxus5/JjC9Ox9Krc3rlSIE9wbVNvOiv3o6
	 l2eCJ4qzamkoCIDNK6koYH74PLcPyFvn0ANk9IqcCrD9lWyMddJnh6Kxm01xKhzM6INrY
	 Gm8kAFT3T3ZacOPY7R8ME+v7NcAA183+0Ds7OFejvAxwI0WeviZRvq0WzhlmvNv4NhjyM
	 Ig4HEUVYNKGc+4/vrDeWx7ISlllqEBFJDU4QVvq3ojzrolZIF/6OC66HxSapSg/CsfgB2
	 aoiilZTz0yQ58yZyYiiVXrF7uJe9a5L8WX8F0ntS9KNFlLl6ox1SYi9GN12/dGdbBug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2EF606A329;
	Tue, 24 Nov 2026 19:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE2EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.207])
	by APP-03 (Coremail) with SMTP id rQCowABHGZo65gVrD7C3AQ--.17886S2;
	Wed, 25 Nov 2026 03:32:12 +0800 (CST)
Message-ID: <f818f0facb3af35e31b8346546c1aa23b10bd529.camel@iscas.ac.cn>
Subject: Re: [PATCH 1/3] dt-bindings: usb: vialab,vl817: use
 unevaluatedProperties
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Kaehlcke	
 <mka@chromium.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Anand Moon	
 <linux.amoon@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>
Date: Wed, 25 Nov 2026 03:32:10 +0800
In-Reply-To: <20261124-rehab-overlord-9b7f44ee7e0f@spud>
References: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
	 <20261124-vl817-uneval-prop-v1-1-137c093fb300@iscas.ac.cn>
	 <20261124-rehab-overlord-9b7f44ee7e0f@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowABHGZo65gVrD7C3AQ--.17886S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWxZr15Zw1DKw4rArWDurg_yoW8uF1rpr
	WfKF98KF4qgrnxGws2gF4xCw1Fq3Zrtrs8GFyUZryDXFW5u3W5trsxK3s0vF48Cr1xuay2
	9FWDKa4rtF1vkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07betCcUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-24=E4=BA=8C=E7=9A=84 18:16 +0000=EF=BC=8CConor Dooley=E5=
=86=99=E9=81=93=EF=BC=9A
> On Tue, Nov 24, 2026 at 04:31:01PM +0800, Icenowy Zheng wrote:
> > Currently the VL817 binding has additionalProperties set to false
> > instead of unevaluatedProperties, which disallows properties documented
> > in the parent schema.
>=20
> This is not quite true though, they're permitted if the binding contains
> "foo: true" etc - which this one does.
>=20
> > Change it to unevaluatedProperties, which is the better practice for
> > derived schemas.
>=20
> Not really, it's fine to do addtionalProps: false + foo: true if only
> a subset of the inherited properties are valid.

The main meaning here is to allow downstream nodes described in the usb-
hub.yaml file, especially downstream device nodes (which was a regular
expression match in usb-hub.yaml).

I don't think it wise to duplicate that regular expression in all hub
binding files.

However maybe I should change the commit message?

>=20
> IMO this series should be two patches, or maybe even just one that
> changes the ref (as your patch 2 does) and sets the then derived
> property to true. Otherwise, this should be two patches, with patch 3
> split into whichever of patch 1 and 2 is relevant.

I'm okay to just drop patch 3; in fact I send it as a split patch just
because I'm feeling that it's not so needed.

In addtion I'm also okay to squash patch 1 and 2.

Thanks,
Icenowy

>=20
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> >  Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/=
Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > index c815010ba9c2e..d0484e48e319c 100644
> > --- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > @@ -40,7 +40,7 @@ required:
> >    - vdd-supply
> >    - peer-hub
> > =20
> > -additionalProperties: false
> > +unevaluatedProperties: false
> > =20
> >  examples:
> >    - |
> >=20
> > --=20
> > 2.56.0
> >=20
> >=20

