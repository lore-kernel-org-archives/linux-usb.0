Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511941;
	b=di7dxsULxbSadBzAqjRDbuDT06fiuBy1s1xzVNjzSjTC4skRIzqFjg7FOVE8cWplZMjM
	 zqUOM9vTq5v3QPspH9LsBoI7B35khyY8UQlVNP0bcIRC8gdU9IjmGJUa5lrlGefrkjvho
	 dh+2DasNDHrRaWNd2X2i4raSQHJGbC6dirwJyOMU0LbcfZlMsXktT6B04guzpmGuwJryD
	 xPISRUuncqWiHDl1z1UoC85mdD2aTowB+aczRbYlIYV5HmDgQGY7mUvB5yN+NiWV5kfDI
	 nHoOrO56r0E7kqHU4ll7xuYzRntPmtF7Y4YaerxcUTyfiJ5BuncfyEO6bYqzdshXHLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511941;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=XocY+M1AcIUeIJvs0qU03q4fW/jTPO4xx3yX5EWKMd4=;
	b=e70Iomj//6ZyLLZIdOK1k7nIOYiErayroQqYBBDeCB9r799dv8PoYvyuSoukUDdm6nDx
	 4/mQJ17UqKXdnPNNtKDrD+c9TWafQq/brTD95XSPM/ILLsd/qLnVmLHCVYkUMhK5rFXHG
	 HTSvm4NhhDOT4nAHL27u3jxGTizxglRmy4Fxg/2FyV3Xft8Ie/9VfOIORuItPZ8nC+8lI
	 woxci/WeR624Y1s4FMaKjSEdIE/sHhW7d1aAgaGs3BIzbndTrnxrCVe8Joq3E+JkxBhzq
	 a/8Uj7tfMgZEPH032RYRsQakl+VFKLNbgRdBOP2BQdZ3EU2oXBtWJ+rZDHILfr/ZzbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=R0Ms4PZe;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bRUwkXSZ;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9EA606A321
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9EA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=R0Ms4PZe;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bRUwkXSZ
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DA4087A0416
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 04:18:50 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 04:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795511921;
	 x=1795598321; bh=XocY+M1AcIUeIJvs0qU03q4fW/jTPO4xx3yX5EWKMd4=; b=
	R0Ms4PZeqAkU1DDBEVsGat4DITypGqS2HTKHdWUJ+DbKw1ZvqUulkf/bGo2pJymr
	YH6KbJbZCzc5IP/0a0Dc8rUvID/l09lPDhcU1ZeUyQh5pMCJrguYF7ctJgFeR4EA
	toCdPGcBM2ODtnvD2HXuzlzENTmbGN8MmCeSuMQx2CJT4XkeGWa0kg0zgnGQ5KiY
	iN2VunAvsrmUc5+tO/VeI9xYz2vBaNIXPoQ5gMi7Zdd3ceJ5C3wUkl8gdLMJMYQy
	dH8kAS7o2x0bPVHQFn0RetXunU00AoumlHajbN9yvs0ufrA9tyU99vcQWLT4+3E1
	oN/T3N8jqjoZwU9NfE/5EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795511921; x=
	1795598321; bh=XocY+M1AcIUeIJvs0qU03q4fW/jTPO4xx3yX5EWKMd4=; b=b
	RUwkXSZ16+iE9s79Rdw+XXDMwHjCA57nnRbNjbz4pxldE8BzX19sa2lzIyCDjed9
	6coECF+7jNZXE6PddkfIlcpe+Wy48AnsLVX1GgxFRAfpgMoqgAaIFcPb5NLPX/0v
	gCZXfu7G2pUgIiNN6KToE/r7NcrHW5I+f0He1BUJk9PfiRr1/pvpN8+2BuFpxlbI
	iO75D81eoaQL+umZLWYxAcV9w/TeoZqhzhMXU78i/F/1rrg2ftfWZDNwUNjcAztf
	dKnNJOg+LJdB+Nf3d5C7Zi99uCXsEtX98yU+nvOv5JopqG/btzG8OPPfr1qPS77d
	tpqJ2Nxpdv+WaGevfDA3g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795511921; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:dFFMdjZdOEC9nnZK3t3jJmc1zb7RgYSapr4plljwefiyfRW
	hzu2PCYDPqe4CGPIOdiBvwqPznAnsp+nWWzpF6d06e/Lv/ZEdAFnQMAAPCwjQppv
	piC3OGMusutdI2KWuiXp5y0CM/aK5M3VDhKYpTtpLzmbftje0UjLECukuYwnxJ06
	4B3gI2PoRc2rP27xKhZgbAksqYp+n6QUmKvmYebnXn9fUDHRPLYwxd19v/+zlDzc
	I48YxZgJbyBFlz+HVyX6PckadW8Tt4F2aNVtqzAXfaw9C+Ae1KpE7opIgCd9wqku
	QZu4SiLj0m62MxNCNkTk+UxLgvAGIld23g4XVhQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lOJvyBuFvi/IgWkarJ75xdxMUrYdqmOeuxDssazp7h0=:B3Mj+76bVMQxXOi8IqWqtsFyzskk/wTbXDuEh/uIyrY=;
X-ME-Sender: <xms:bFYFa0giqAGvgzU3JUvEU1ioAgA0YwHWmPTMjt9z7vrXoJBvAnbfvQ>
    <xme:bFYFa30cUqn5JBAc3jvWzupGlDrK40He8RC5dt-u1YdMAzNqpPOyibuRIpHJhDWPb
    7yvsYWRY0JibANghS1fYzU8oF5yOsT2HLCSqQkarh3YOYSV6uv-dGk>
X-ME-Proxy-Cause: dmFkZTGRtg4XF1eY6KI/R8BRBNaqE9DOsPcN/jTjzdrzqiK/3Q7XtTIjabc3oZpqwjiEGu
    ThX6CzOJcz7Ciga8bHw5lzibadEkqVv/4bBoTU4nod7jlB/lVCx9QFHljKp7ah9QybAWSE
    ZHQaGB2GgaOLwHkt1vZ4m9Sza3Y1Xy8Vw1GElFEGQhmE6VfTlhDZ7Sgjc9BMcUubBAq3Iv
    RarWI8hvqXGmey23V0fkBKtpnYBkV/0RIcbC5RdrgUgHqibcTuZp4sE6sBAvXnCojRLYGg
    tccO3mZ+880fhyqHXlH7uhDZo1oKw4e2FzYieJUmOg1XN/jLXDk+bD3murJWTlQQds4Uow
    Ep+ziyhhQE9xZqh3wToitVtzuhux7Oz8IZwPhcpc9P8X5bC3bgcGrKaUQLsImb+FUMCd6A
    BN6ZD3ZkEe9GwS0ToyfqV0Yj8AyglkgOvnruX+7zFOwAO8l2yj8BJzf096m1NeY6h95NKy
    5OuSmmftL+9tog77eDrJB1SUzIhg7k9ry2LiQ55WVcUj2jzwVINa3cRu/99s5/7tZSw6ia
    strJHPU88xx00CPkOasY1iyfpGqr3jdjJ9FvuY4HfhXkYO0THkpDE0wUBXfong4+2bg8NZ
    GiIyNDaZt3b4IBuM56KkHSjHd3fi9WafDEHS8iezbGIB3iQYNLnK78X5ncnw
X-ME-Proxy: <xmx:blYFawE0y68xoizWhCLQI-K0N2Ad4zgAwa1PavuJf1OI9hlu-9Z-Lw>
    <xmx:blYFaytWkAoTJBL400cZwTKWfuAd1DNU6fiTmsUcIQvkjd1MCZOW0A>
    <xmx:blYFayqQgraHauytHWogEGrpXKAEWGgKz7j-2tNebkHUIodTyvEMAw>
    <xmx:blYFaxmcDZI7tkXTHbjvEkIO4YUecgcx18Uv4_y1kDelc-XAKC7Qeg>
    <xmx:cVYFawtMI4qIaxxCnzY9pjdd5QiiNLOG2J_SfqD11XqheEqpqWOGwI0->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6E2D032A009E; Tue, 24 Nov 2026 04:18:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AIWdN_2nP-rJ
Date: Tue, 24 Nov 2026 10:18:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>,
 "Vinod Koul" <vkoul@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>
Message-Id: <9fa428e0-f685-410c-bcdd-319fd427d2cc@app.fastmail.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Sep 13, 2026, at 16:40, Krishna Kurapati wrote:

> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index ea47975e288a..038c2b58bbe1 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -21,6 +21,8 @@
>  #include <linux/phy/phy-lvds.h>
>  #include <linux/phy/phy-mipi-dphy.h>
> 
> +#include <dt-bindings/phy/phy.h>
> +
>  struct phy;

This broke the build in linux-next because there are now two conflicting
definitions of PHY_TYPE_PCIE visible in drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:

In file included from include/linux/phy/phy.h:25,
                 from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
   15 | #define PHY_TYPE_PCIE           2
      |                                 ^
drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
   47 |         PHY_TYPE_PCIE = 1,
      |         ^~~~~~~~~~~~~

We probably just need to rename the enum values in phy-qcom-uniphy-pcie-28lp.c.

     Arnd
