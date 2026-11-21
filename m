Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219826;
	b=Xj2jGecsgj/OBWlZvjlm441c7aum1sKQA4zYlwBEPxExCbj58vQAhxvUCATWnXJr9DIz
	 A+a7AyfJMu3DlJ7aCsltOWvZ7VvvuKzJBll9y5ec+bKdJ7f2GAZTpLyLqRQlWdZ7C7VXR
	 bUsG5Fdt74Uth/8cFUIYfzXFJX4N1GF8eI0nKBSk9T4PIIsOaLfO+J+jmWSQFZjzvxv/C
	 SKOowPJGpIfsnspnK+/4IxF6iDVMVxzv/Q+liTUpKGitHVIUS6QFwP+Y0uft0/7U5EH4B
	 12/YvGVlUyM8kZexHZY1RXQaLBccbItSxR60FFyMyEkH2vIEAOzrNGqkJWGJ09lOE2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
	b=l3v9NNBfpwmsPJ73Nocl8xcwOeTRahO9vZt9GOu1mblK2XnXgECqKCr9PtHGFiFKZak0
	 QNV+F3Ito5oSms1O8f+0JxMVHHz8O+CgTl+WBMLrVFUcZZ/RncDX930NZLKjWSpR+H54m
	 sMYYhZR6n0zV4tyDT6g4sj7ffv11eEgg/3dSvi9dduvOUj8COQAjdEhd7CabGONHAdFcm
	 Q3PWn1agUxIcOC5fAmUXkmZl7Do8wzWXFJ5AvzD7T0vWjFKMOmsSB5Y2C3tm+0eNCX7Qc
	 TPcfEupH5nT3E02CKiLHeiRE5auZS/kgQwal8G1DqekRtM7B3EsnWSePa3ITCsW/V/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rWu/61jM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BC160A260A
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 00:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BC160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWu/61jM
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so1841911a12.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 16:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795219823; cv=none;
        d=google.com; s=arc-20260327;
        b=MxsHUW+k1mVZtZv/Qw/4ITd08nWMYCDQ1dWoLHk6cw/Js3SrHLilO4/tOQG91g1TEp
         q0UO6FVGEa+vQPlKn0oRywWO1i1LrvqwupalPdv1smuGayd9YQ5seJ0Ds3/hGsXz+mHa
         k0AW/HRPbKW3iwJCYs1IE6dBbI9EBGeoswRGWRQQaRrMMD+v+0Gfepksp1vG1YRre32+
         AzsVKSLb0w3PYr1FrrhItw4Zntgktd7e82dv4dTnU0vKQiJw3+TwNny3oUtVfxUwnt9g
         76HNI41LubZvUcaKBSrXBI7VoDzRYDWUb6qkGDG57D5of+yZTCpjDjZeI+6sVmaRGDhh
         1yOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        fh=LsC+5j+GEXHjDZE0qK7CLz3SNxYFLrUm9EwLwA5QzUY=;
        b=oqZRYGJ5ekRYHdTAARgSO6f3ed3zxXrAzxvdZDFuwkHMza6Aj2/4Xn51MescrV9kwp
         Z0L7d9tGC3AbP3OeCW/061UMCvPJenKcYJsOeZkujglJysNdBIq9u8jr/1fEfGpBj9IX
         ppF7UWUYso8bJySMTxQnriItLeU3r0OPNT8FW422adkLHk9BI8CCmjVbY6DgAVqURVWr
         +9KFOmE/7VLqyNhWmFELcq2h/2p6LlwdIc6F2nLRRw8hpr+uEhEN9t3XzaYnerTjp/IW
         yln6xrb5CHTK1a/5Bj1hENMYfcMZ+TCbjA5jNOkGYOjf2VAGk0I78KTNX8BplDdwHcdZ
         teUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219823; x=1795824623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        b=rWu/61jMhKyJ7vUuMCuiQUvlkSliD77v7oad+tKvc3mo0PxskhgU2oarlrhRONLIcH
         C7hwCw7DkhFUS1Fi0FSKfOqc73f7DCAqeIXJaYqeWe4ua/i4C86BeHZBDLke7PmVjd4a
         vhA7/NktPXU9YECCmOqJUT3pzs8+bsZIXhief7I3hTFaHixljFNONSDfB+TYvmYeXBwk
         3NKHs6jdXfoLnmSx8i0rdzxQZN6EdSt04rLza/oDALWmDwZYp/6bz7aSa0ClSmneFf3l
         2DPP3lW/sISNoTPUtLdMt68jJvaBvYReon4N/wsAN41olGMHIef7cE9/j1YrSHiQ/M5o
         n3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219823; x=1795824623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        b=wYvyQV8z22dVOjvz/sYgwBZgbwqQIZiE0OZzA8cg2jXDpnmssGA9Zq1ENzqxZM980R
         Yaz9v2vfYRm+PuNO6kv5il2rO3+kmece2l7a1Cpx5HuEjoAelAR8uat8IBqJfRxvphaG
         vyPIHIe2kCZk4fKahmrlWl0JGcc0o1M+c2Yz5VdtAMmmEbYgy/kRoWioYXa02RkL6dIE
         sFtx87I77d9AadbFf2pZaBzMlcZwO0hi2t8Txtqs8BQqLWh/SanULnnWExPngZ503lvN
         OE90ZIOYjftyxYjfFdyTeM7Z/r+/WN/ryma/5sLmJn0ip9Pce4+VViv2L1DxqKrRxoNX
         ahdg==
X-Gm-Message-State: APuU4Z9Otg934kSEe58k4sOR4S88M8PCTx1go4Heb/TMPxMI6t95hcrM
	n+BjOQkMjs0WUUS6PeXRHILXdG8FvNazB91DoN5PojRbERv0ZEKhJ2amdcFfKWRYGLuLcs8ASFF
	psEWng2QIEOCENp28UjRNE/o4JEZPG48=
X-Gm-Gg: AZFdTZeWB3BqqoZFRd31WtrUJ5S2senynr3lJaMhF27J4uaGqRjDvy92sDUVrsAWVBs
	Vvs/MU2FVpZ3wLPdTN5oIWQMBFtuKIZJO8+3OYe/5ku/ROhuD1abHC7WmLxgjwGR5Kcuq5y1rgs
	YtyO6PVU8ZHKmEgK0ACS945VM1JiMKT+1/CSnknMmgul3fJAwJPCD9MQMNF+IUt5mKBjkq6mEr1
	KTQhptCgc2EW6Tir9Qn1M5p4jIZQjIBYt7TMu1isn+/TiLcWVXa16KPhlTxeNVU6tp86a5yjnwu
	PLFE0tV9iHSfyq7Euivs6oGFd+YRGJqG/KGqp/GWIfKzMmfRsHPJMdPcJSJ7yhb7aYkJVs4SksI
	hPk2JdWIYRKx1kIpqiWNKxTeY3w8QT35i5xsGCwMo0szNPHtwTMVn1qyZdHY3ta9OLneRI9nc84
	RFcdPj97knjArtQ2Nr7nIlpoPhVYP+okCRVgVDO22OLqq6dNR41hLoXvN7HioiiqcXKbDijF9Pj
	y8aOHRln1SRLquasyG0N2BUCTfIkhw8Vy7a/EAK+Nx3FVfpEYY/78htOHIbwecD46a2TFk=
X-Received: by 2002:a05:6402:3514:b0:6ba:144f:ae3b with SMTP id
 4fb4d7f45d1cf-6ba37c76a3amr3704257a12.4.1795219822716; Fri, 20 Nov 2026
 16:10:22 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921015952.1047410-1-rosenp@gmail.com> <2026112019-remote-retrieval-69b8@gregkh>
In-Reply-To: <2026112019-remote-retrieval-69b8@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Nov 2026 16:10:11 -0800
X-Gm-Features: Aa3M54p1_AfZUO6TiqmxTg4P4xauKpOoOjWuBAIoMhd1On__6G_1-ybx3Wy-ssU
Message-ID: <CAKxU2N_kX=HoQML1_udexrqM5h1o6-eegNhuZzMORZkSRVJ8CA@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: tegra: embed UTMI pad config in phy struct
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:40=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 20, 2026 at 06:59:52PM -0700, Rosen Penev wrote:
> > The UTMI pad configuration was kept in a heap-allocated void * member o=
f
> > struct tegra_usb_phy, even though the driver is the only user of the
> > field.  Embed the struct directly in the phy state to drop the
> > allocation and the void pointer indirection.  The config is
> > zero-initialized when the phy struct is allocated, so no extra init
> > is needed.
>
> But why is this needed?  What does this "fix"?
It's only a cleanup. That section just clarifies that behavior is the same.
