Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774913;
	b=zb1YlL1uvMGhpJ22OfzBA/3zdTAHl97N93Hs9K+SX9BZq78zGYvwsYRs4P61BZ11LZWE
	 GlwHyD80dv2/UOXg3V9pcHURbUPVD0Gs7LMp5gntwcxM96soAnQI1W8eYUvAoLl80A4JC
	 dT/5lHjPwG6GvC8oeGMnL8b7jYDBDQQDw5x+nnMguiWXwYIPnnrD3GfjldSGTj/U2WoE8
	 BoWdgmfh9J4MtBXK/rfHjDjBGmqKfaIoeBGkJzgimQ9kCyTbao/TatV+NS68z1F/GK1v6
	 8e0JFqOCgf/KgFN/6yR74sP7wpFz3jzR2PRAV3m0ist+rdAjHUglBE4AZ7kj3dVuZ/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
	b=mn7MH2Uoqb7rX/hiW43MXseaeZI7UdB+eGz+0uf+FV9cwFoT0vnx8aBizavYiyEUMFY8
	 i5W9yDimypReiTG6LZjIQEOMBM1w8k2V7fY/GUAespSq5CWwIYtDpwO+kWMSqjCPR7m7w
	 WzDAgdGf2SPHmWma1+vHXUNWQz3v7nS3wWXTzxhE9B30GAY4QZukMecv6c3l6jOE5xuvQ
	 fLhx9Kn3XSY0tLJ3aWNF9Inwwt9YW5ht6/MUMGWsuNfGPrtGtdM0lXVXFVdIUurMN5ZST
	 K+ObscSqoEsUY0zY5y55IPn/iv5KUfvUQj9JWbDVW1IDTg5lKXXlg8C2BbKS8S5R7vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBK7im3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8583606A329
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 20:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8583606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBK7im3
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677bc4704cbso2685574d50.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 12:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794774912; cv=none;
        d=google.com; s=arc-20260327;
        b=YrQ7dHiRW1vRPIlBQZGuDQ0L/20N0VUUQKKOeDixoXfxusmbAPgOs3Vgt37LXNs3QV
         2jkG2fQNzGtVwE7u5ed025mtEG9BcjW/KYNLlTBZjg1O+FlQ50UUnsSR52u+6UxWffDu
         xKOWvrm10o8SIQqEsxz0LKTqWAP599m6a/SRnzyeGvR3wYBy7drvsUNKYvcInd90cmAh
         FllAJM0D/NZV906KGr6jN9H8nBDoUZT4r7nM+kiE9ZDOXjC9s/r9FY9MUROXzqpVMijM
         cCoDUVsLHQWeamGdmWBvvmdxJRD6KUsaCZgGE7tSpOAojn5RBKhYMEpbsnNgVjS863aL
         xQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        fh=kN6m2SG9vE9aeaQs3SFlL27iR9b5r9v5SLyd+FHRXvc=;
        b=Y+CYlTlxkRKTo/cNb1IwydS5/ndcIckVAj/SWaALwf+duoGA3QSgWuTy9+bzoefdis
         +gzYimab+wPANTJX5uT1dXwBO/rI52/M/D2JcOtLSUx3Qk8zBp63YoG7TBEu1DZrOuZ6
         9sZ18H2ONKt54U+0rKwWBwiz9Ys2fRF2QhtM7YGBPcdRLqaXrWbrTy7NhxVJp6rBGraE
         xwSr6ERcRSKNP6qsgIXK6kAJqH4PqflIFJEPlme7NaVNtX4ixKPD4W4XcO+gVqzp9kRh
         q0tG3SNsiziRs/j7Nv9YycED89ArCnWD6F53ICu2Tf/a+m1vfcHvNMrmzo38KoTQ+7Gq
         PKDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794774912; x=1795379712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=TzBK7im3+A4TiHE8I1qr19R9+l0rNSyHA0FD1ldcuLLKw1GjH6aCJNIaK1H04kn3Kt
         tq5BWmYEFXeGwK6Fw/3kFe9rGnRajOyFIVndChGVmR1Aw2BDigzZbBodCm5A6Cc9bStB
         W4UbsLi0e0KPaOH3/AkiJO+gXsar0r5vtdsMi3Qy/czfHW0hhWap/KazaPCqm5oDF9Fm
         II/ddsLBDRW1iVoWxcLCNHuYP8V9XU6Xqtk7aCd/drSvKhv1VS7TxCvq8iWt56MZeDlH
         EDlSJ5KYossvwEWcFTNeNxEeCBnlYEqok51o3nrg83hAKJp6+arb9VvCD7nM0gaePGSV
         Oqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794774912; x=1795379712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfoGaPOvarXU+50W/KFhlCJQD8hal54gXW4WmBlLFMM=;
        b=QfOPNIknjsDS2Z21Vgg1wGUvL3zpPHmJqxtHQ5fvaLDB7If95hFXHqAvk1Ea61Wls+
         624qIBmFjSe1BegRavVsuWzmZkzwoq7yMhobuWD1S3UB+2kU0ozr8DsJwp/LjUig+SaA
         nUpdn/W1GvxTCIvTiyW0XI81JZ1EsFdnrBe34gMoBas/S6MmEV3ZrCiLQVOha8lLVZ8g
         4HfpFmJWJPNds/TzW3snFxQRhdJpAVWbHmabYonx2jcaqy8GomYk1d+LR1f/PClCjU19
         XzkM3z7G0PJ5ySjdUVowuAQAebhVz5tqzGJMyxluigQBox378XOcjgVNvM/aOTWx8wEF
         5poQ==
X-Forwarded-Encrypted: i=1; AL+hErHT7MfcDT97iUyqVOvv+7yeLM8WHfkkKJbHc5UYOmtU/AoVvfjlsOdZnqTEHxOGAMHA3ji82O8Ykvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YWKJxXUXavBo2ZmXO9TivBvY+vT3atNoZeUkuOQgNfMLtrnT1
	HqkqBy6UZJBuvCTQ5PbKnr9A/6e0lOTd7g66PcIPxkM+sWnDTsY3dnKV0tLgSBJEvNQBelocAqF
	YHPzP41cu+IaxDShk0T0HU0nTA7cdYXE=
X-Gm-Gg: AYBFou2DGeRpwJcUXZrVZmZ+JObRxohD8ODgqcZGsMu/nwZpcwgyJEPtdNvSBBYh2iv
	hOrQXVHBh+qiQ4bSoTJQ9DwLsubeBJUDlWw8sjH2wtbr4S92X4bK1g8FhsmecIda/FELJlFDQCe
	G1himZHqvMQzxmYUvwV6SWU9cE3zR2D7SFgubpVuinJ3ByKxna4xaPH1ZcwVasgQ5vKLrwA/EY1
	E+dxEfWkOsaR5YXHMHbg7dh3esIx2uo//6EoukWeXoCCazvXj/4PnXNvI4CkJn3hnUdCZhluEgA
	wlSVGkgzeOPjz67GDy9IIEWgvCVLGy0mwxt1qZVO/ScVyDV272QBkqLKMWiBrPhB/jG2Y2kw/N0
	u9TwwLwcXWaxWZGJvBtcvpreHVTlaBaR/nP+1Fki1XAlxHeOaRy/guhKPk85Ap/fWOo0Asw==
X-Received: by 2002:a05:690e:12cb:b0:67d:b94b:6021 with SMTP id
 956f58d0204a3-67db94b66dcmr213466d50.143.1794774911740; Sun, 15 Nov 2026
 12:35:11 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 21:35:01 +0100
X-Gm-Features: AclHuK-bZ0RnQfOiBUZa9VF3gQt02asaFssBFzc6vFvqnEmYWhTqvHFuHS-Culc
Message-ID: <CAFBinCDfE9J7fFnvJ2YqeFx1ZijY+5aFjGcpcBLMDrnpU8OipA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, krzk+dt@kernel.org
Cc: gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:46=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The S4 USB glue is the G12A one, but it fronts an xHCI host controller
> instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
> compatible with the G12A one as fallback, and allow a generic xHCI
> child node.
Krzysztof, I have have a question regarding the last sentence:

[...]
>      oneOf:
>        - $ref: dwc2.yaml#
>        - $ref: snps,dwc3.yaml#
> +      - $ref: generic-xhci.yaml#
Does this mean we need to the allowed child-nodes to the compatible
string (so only S4 allows generic-xhci and G12A only allows dwc2/dwc3
but not generic-xhci)?
