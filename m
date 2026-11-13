Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558040;
	b=UbQRK3AsEduRZg9KbaJa+70iyDZcWx+u0M6nyqF0etioATUAIOjWfPZjrgOt8rY8lzau
	 peIryUS2iaWbh7l8PjjlTFQnfJH8iPG0N/hW816ghgpwOzda9mvGFWYv+JT8tVQ3tgN8D
	 TgRVobJPhDR+Wew2lEKLy7idnruxrLtlEtPxcSNA1OwpRGfZB//m/+9BEY3eiA25ovRGk
	 imL547W1VB9tPVZzxf1rC97PX3/jZ96nVwHnudw8YcOvk9t5jBtJAGgPCF4+q4vpRzk4V
	 WU1kZjaxqrYibPkzn0GnbT+yKIZT5MuUpkvZn+u25teosldc44v8jHd+lpEG5sh55Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
	b=mIJqayB/Bdmu6yIwVeD3iKpIn0MmaV392L4NkaFg6k99CwZ/u0wWGvF/CNgCJB69St3U
	 CAGlwSaJsOrbp7KLGHpsvhblfUCx/GG79+6HmXmKbBoVPOIj6dsCl+7KGpOuSfhfa1Un8
	 hDq+CRL+lPys7D+YA4cUuSfVxZ2DbuoYw8aqA2GfRKuZGzKNuzMzJ35VqOHZx3I9dvMYp
	 CRh8lCbHwxsBgACPzWShaCk9bzupgCtn2P31v+tjDuhP45VrYjrf4JJoLYQaTi2pFKJ13
	 Y1elc0LYHvUpUWqKj/39jodx7wttmDgmjyy/hlu0sS4KH5TZJi3DHGbxjRuxGx/2gMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHhozOY0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC30606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 08:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHhozOY0
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso1343871fa.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 00:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558039; cv=none;
        d=google.com; s=arc-20260327;
        b=deKhU7jvSgZzj8xd3tz2fxgJYD1nOYx7rDrYp0eujf6ZoMgY35NlKnfzIa6sFTyuoX
         LEe7Qchah8um2JDyegZ5UrrXdvX7q7KemyY13onBuExju1KgbzhoBfzLc3tC3q9c+qLn
         kukRAGzfUejQVjNDpspsZBU8LvXFwvL3SmfbtBeELfXsk8i4j6EITppV163S+iKBMxWl
         LtGqGlLwfE2MUHThMq8w7BaOTUZ2WZC8B+5Fciy+uJKyuCTRgNTmYcneUmmBZzrZQ2AM
         96cId0v6BYtHAGyqfKperInCEYOmy/MJQ7UrO/ewkL+sYgr+17wAWdKMIVyHO2sfZq8T
         jA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        fh=dgBrutSHZrxxkVBe4l4aAyT9m2ydrp1e5vWx6rQZU5A=;
        b=RZC8REiOmBeW6miKZjBuqSe+WZjJexEebUP3PgjescLO96TpYWbIVn5HGjWWaqTYOB
         32bJW3Xcs9xmwTnE0T6bU9RHN3RCqE98d2flnbfpxwZYi5qoauzRn2zaBOeZQdciFVZG
         gYJYY9s1nojMhIK71lYG3dRKDQ/foJhAFU4Q7SFmNv+xxVnGeb5BrrhW43Mf2A/ARiR/
         Vcz+HskyacxVQo6cmXgkkdDmisQZVD/+HfNUwdF2fbOXaK1XM4BISjcCYARPYZg1CbRI
         0WXaWF3iQOfNRc4bzThdWa+kWXwgquFQ7bOyIA1p8BTBXMst11XEfRNZWuZh1y/JnbrP
         EUYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558039; x=1795162839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=xHhozOY0NJ2QC6eQD/p+zobo+GcRPv7sezbHuV39CnsJv+rIFMXaRxdJiXo4HMW5rk
         kdxvT7jERlvnC68k2QiiLyZBRz0Ugps4BstnvYKRHz5kDQ7XrUh/llNQWvuncUNrlHtb
         UPAURYJDSTDhXQAGVBdPLs3MbasyoOzuhkKkSlqdmvs7/hg/e76tWeuXBnwTKZWjyeNl
         6gPLUcwoKmikMRmwQogewu/eo82l858Atm07y51VNrCQ7+NeVO/+QfbKpyK8znspUjBN
         CxiJHKQWIU0idMqoy3WQW8DkOPmPpJtd1qWjg7LA0ELH3ls0J8uIExMIUmyu7vTMrdcW
         OmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558039; x=1795162839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qfKfJJI7wxhAdDWtpsGEzNb54cWJZYAwY7eIBpXfiDk=;
        b=j0QEWTqYEydlpg3WTKwGDsKs20bpXIGNsx9mbsX0GKDfOPn/4zGnjx49AaFxHJaBmT
         Xwdx6vQRS4Kc5QHELtq2lLj0WCrvmvFebH1v0pZcRgDfW2XxUljtJoURHivrHG/UZnJz
         hA5OugL4BunFOA4hbHKmKXAi0Ea4RLCS/upC0X3c2xTEQvbX8ypSuBnKs0aO1p+fWuMt
         vQ81DlZvdNJbepwti8nB9lUDaImlG2ulnnDoNk/XM419r/VTFVpic5OfAWMtBz5+t3Ux
         FVoa2sZQqfBHbNQPEv4bQT8J312lEtLKRhdQ7Xh9PLI4tVhlCRfZFk40HbwyIetWpByi
         q3NQ==
X-Forwarded-Encrypted: i=1; AL+hErGGsmSVBYFYq6nOxa1sE+PnuZ8svabdHbC4PFP45pr6Qid70pFsJRIQu7PbxhK2fFimXviAREaGCDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DSa3O37so7u7tw0l5dtnfKwswJ8MuDGeOlNWPHm1qEaTsVVfr
	28HG+Ua6t/FPJJzIh5hW2QU2SLWilu1W/OPgYTFiQhvDTOn7MWspW1PKRzsMw6/kZk013r58rn7
	BL8/YCPVWtTF/WuUPXRaxzTop8Pk/OL8=
X-Gm-Gg: AYBFou1uPu1H3CQACLWeMmH6nAFZE+aF0/03AN2Y3FJNmc2jJgITTkkXye4cmgyWgZb
	oL0/NgghsPLok5lJ51edFoi/reGp1TnMG2yUj5a4GKGwUyOBcF+RYijjv71wkWxzs70FNYvDcql
	erGHrjRCkk6DMY/IB5bKx97zSPTY39zItYEHZyyd76W/ufJJIhkWxnjWzsG+RmwOZTLLF8StRUj
	awqrJWpwVbV5csVQKOQqglozc4Jf3X6XUTaYAAj/lga4paMkgr+hjUEeyY+LIJ//2Thn5fXuKjH
	jmtsluGTtCLhAWuFnGi7GOCqtlb8h6m2HXbPCSDUQF8hN06QOOOc0+bLZ5ezA2/DQ2c/35fWCol
	nQ8dOHdg5OYmZGcjZuHs+rGiakzDSgBGp0eDVwbYDJk3/A1LVcnnR3Ws2fWp2xIpjo1UAAZc=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr849129e87.0.1794558038625; Fri, 13 Nov 2026
 00:20:38 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
 <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com> <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
In-Reply-To: <CAGb2v64xjbc2t+fMegBUSptiwT5FQBqc8aqiVkLjwfaB+3FV0A@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:20:26 -0800
X-Gm-Features: AclHuK8fPl6O1DLxtbIbOB_Tvsw2cAGJCYYC3mBqm8ET2-FLO8BbsLPv08rZzEo
Message-ID: <CAEy9hNXErDHYorhMp+xVz-A1tYs7JSEdFYApCK5AO1nMAFDqCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> It should definitely use the raw port number, since that is what is
> supposed to be used in DT (and what is used in ACPI).

Thanks. v2 crossed with your mail; v3 will use the raw port number.

> FWIW I'm also pushing a series to wire up USB on M.2 connectors [1].
> That also has some code that does OF graph lookup.

I'll look at it for v3 and reuse what fits.

Arun
