Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287973;
	b=at9cmFDSXvKW1O77f0n4pF32sxctEapok9yNL0wMsCzQffhLVfxlEd4bZhJKYXh1o+Xi
	 vXy3lALl3ZM5VN99LjqXDuunloWz9qhzgG+rzUDNcQTQeUyTA5E1K8WEeB3Cn5EZ037wP
	 2/3k1PLsMBfMUnO6sEn0PiL/az+8bwPK2SF/xAX8sTfpLDPhHXOhwNFUpEIj3rUGMGQNh
	 yYGEJ0q5lKamz/qdHsWH6fN5SwvgeDoXzTtrDPVU2f5PFaZ/dIRSlQdOOt7dTrqF9xzoF
	 nrhtd648dVMQvNntlz6zE+haj1BRA8pxzr2DxkAtOeIy1Ah9UM3damujVdgD4T1hKgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
	b=n/z2mCzSyXszuy5xNH7II1CtFGW9Nh3p1NtpASgICFvKbHkYBKqhfLKezLupv29brH0h
	 kO4otxg6A3Q3g4mJ+m6fZyX7VRdZWHIBHHntRYAduRh/epd8cdfxy1OepfPuJ83bw6Rjj
	 ctJjLC//EG13f9nMywsJSg0yb96Xoi1GOK775K4dst8S6e0SHGnZDFfsniGaajWg3jpWW
	 mIlf8HhNUI/HF9jyGdq8LS1LrbPi3luqEYi5SZGjGmK1o5zXewVO55TuJt6k/M5XbPl9c
	 rcyjdT2sS927TM2MqvdzpqtXk5NF1ckvW3892BVOUQm/iiNmoUh3W1s+QwnKh40J+lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79883606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 19:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79883606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRUFuQH8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so18832965e9.2
        for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287972; x=1795892772; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=dRUFuQH8w4MMSrEuc/tUiHbAWm2e8J0TZVBrfHQOSMQQc0vMhH6D331bHZwmWI0nW2
         lOwdSLLGhfXzgXbQEBKpcvr4+PI3b7XJh4mhRWqOQcNiR7cWa5aPNcNWAzqLnO4DfizM
         opphh1/ieNCtEuzXfWV6VbBhb4yO6YmMnc8jznq9GO072dx30HONa2zs+cUSQbS8TJxV
         m+4h+3WjdKBDkuVYBJ3KduUxejxMzvESrVOUs2AqVsUZ5dslRzyepHS7zppw82DxZaO1
         rw9OiPKIfdAJwSEUOwttDjkpvJ5P6XfNisG/ZtDNOADkU2kxZdvnT4Ieor0Vy+9lLbUP
         RBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287972; x=1795892772;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=XoVANiKw5WmSa+L0C3SKFQvccaJBl7AE+tmfhZOPJFtihrX8IiwgLg8KraOpicsZTq
         GLyH1wmhGH8ctJX8WjX0o5jiCQBskBdFlgBdHkcJlnY0MhTPEQn0u4uKs2yLWKAN+CHc
         o5pX+Y7DJ2doN9zw6bq2W2uldS9EdizpYVF/oMgVFiSOmcASwgPWhsdlCDduK1Jk9K+b
         eBPcTa8I6vVolIA1/8OruoUPON0UwaLwAysXQ+QDgxKqrs7J3ninMuW7UVTkd4mdEUrT
         gg53djdvLqkil24IrGZYRtgZGL86UAZHbwHeuLovhW5YI4EdSNUtlu64W++c0jgiwVMW
         iE7Q==
X-Forwarded-Encrypted: i=1; AL+hErFitQhpJxittXS8Bx8h9BNw5Qt8/q/Qzm6QRH8XgI2Eqb4r4bkY7KH+V7GkRYnUDaxsN5XWODEfA7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z92qOCmL8mwdbbwvbROycp//fq8R0BpoIjjIrXjGr+Ok2JtJ2x2
	NwpWRd0JKOJ0yWIJ4SZn4y5pk7tgPfwpn9XUQFEDQcuuVObhEmPyTpno
X-Gm-Gg: AZFdTZeLm+RDwottupxrkiGUZ0H8yuK5e9t86NIQndsMgQwjz+4s0WfbbmsrcmdGuEA
	nH0YI7tICPTm0Cnqvqll66jkfOy8//SSdN+6v65mYw0UP5BRYZ7RXi4JT0KU5Jf4bK2Z9J2BWbB
	pVH4JSTBWkKCjB9JPIVuLQPX0uDvV44wWtYPYgTKHehHY7pu0KXuTBN/7Bf64nw/4/Id1Vn4evI
	fU/r0iHkDxRmYBphL5njk7sSi35r6loQvCcNr29OxH0PyFGPTdLjolmwicPFKoCWHQUccCMYF5g
	xoyFzSshlATuJAQODzvk8HjuYOdFnDopIR1wafa64xHuPvnrsGbX3SnHKeMAiJAwohxUfkKRtZQ
	O3pvU9iwDVG9LyViSActey36z2aOCEiUuVGqjItn8fVMtqqbCF133bppuE6YhGZV/uSbu0gxCfg
	S9ZzX5QLJVjmmQ6C6M7TrEouCLj1fV4D056thwLkE+trotWzWIlEkk8olChNCaycwLiS+YABJ4K
	JzGkrxNIPeIl11BMRTlQInV5J75613gbUOjSTQ9VcOmtlI21dPGAfuexGsjBenl3ZprHKXN0ik5
	DmOmCsSZyqz5OLViMFST2eq65a8+kR3G3LYXjG00onuqbSoQJZtpfDVouVCajQ5aGB1jbG+Y7Bu
	LDcQnPVxTzmurgq4tjfm0N8zxDOorSA==
X-Received: by 2002:a05:600c:46c4:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb888106damr154232025e9.20.1795287971698;
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm148595925e9.4.2026.11.21.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Message-ID: <6937fed688e4bf1d7cb81b004c179cc4912cf6e2.camel@gmail.com>
Subject: Re: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
From: David Virag <virag.david003@gmail.com>
To: umer.uddin@mentallysanemainliners.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Sat, 21 Nov 2026 20:06:10 +0100
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
References: 
	<20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
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

On Thu, 2026-11-19 at 19:49 +0000, Umer Uddin via B4 Relay wrote:
> Hi guys, this patch series adds support for USB on Exynos7885. This
> series
> is based on David Virag's work[1] I had rebased it onto krzk's for-
> next
> tree and tested it on gta3xllte. This series also enables S2MU005 FG
> on gta3xllte, which is also tested.

Hi, thanks for reviving my old patches

I actually have sent the patches before [1], got some reviews, but only
ended up with the clock patches submitted and applied, and never
actually got to submitting these patches with fixes based on the
reviews (which have been sitting on my PC for quite a while).

I think I will submit my fixed up patches (the ones you submitted still
have some problems), and then your gta3xxlte patches can sit on top.

[1]
https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.dav=
id003@gmail.com/

>=20
> Please note, I did drop enabling USB on jackpotlte, this is because I
> don't have the device myself to test the changes personally and I
> didn't
> want to risk a regression on jackpotlte.

I can confirm it does still work properly on jackpotlte.

Best regards,
David
