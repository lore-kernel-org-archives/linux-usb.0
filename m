Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969C38655B
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787432622; cv=none; b=LxeqYkpxTjNRtuqR/JkmmFZKJs/woAoxcyA1vfhEeDVz4yYJPjQOquqnC9ybqlQAhfcbbh591QlZeXsHIIqqXcq4S/f0ut9p5u/2FnbCy2EEDI3P12w5D7w98KaRC1kSNX/+P2s98OrQElMGtt4RMVwrodVlmJ1umIkcX5x3raY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787432622; c=relaxed/simple;
	bh=pwiiJ4H3HaIWhZS+ojaNMKxfF4YFkeoAeM0o3DHBuSo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7n5v89sxbCIkJToqTCEviY29ZorykM15HXcBaoj5MSxLZsaTazd7BmjLMNK6EvDpRPP4lemauXScxeHwE3RmhzGw3jt66tOqczHH+SNmJp8DK3S/KaylE2Wz5+Q368ZXL04puLcSTy22HTO1LSPyuIba8SDscY2EuZ+8h74lrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp7jzMM+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp7jzMM+"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2055f5a993so253004666b.2
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 14:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787432610; x=1788037410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WcpGyCIEh7F/5f7dZanL/yn6ecJPm8DEjLz6Iy2qqk8=;
        b=mp7jzMM+IGOVWJchtueg0QKTlF7o56lCJn/Fc3L+ZRVpjIGgHuHdjsUNnCAc8CNHNQ
         fmjtCCaMWSfsX6IArfc1e03jQCKkVQf7Kuo2rlKsccKryTDeU1CJj7QaY5w7WXlLnyLe
         ujirCfD2iugT1DMORAVCKcR7rEIDa/cycIVUGO3mcpkP12hbbDBGYOfO2RKRcIvMWUbn
         7QuJ8dv6uEukMWQeRpciPdswNmLMRnnPLDfnVRLO1/1FvLcQb41VS6JT5IdIvh6YuvqF
         Sp6wq4MmOeGYDeB2zMjPEQlQ0DYoUMp/fZS9dovTqv34IvSKD+A0yV9IuR5cqcJJwrXv
         zRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787432610; x=1788037410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcpGyCIEh7F/5f7dZanL/yn6ecJPm8DEjLz6Iy2qqk8=;
        b=mU42z8NYHMq5QuffVzO2Kma+gv9eDIm2VYlH4hYhJbeeNvVRTkQJa2GY8CGYmAKUGh
         mBzjG3wzueBdWbG9lCa+uIDgvxAqdQIRU01zNYEGE0DELSBtIKuKS3xhCADoIOnvM9mE
         tcRV+JEGumy4LjifWLO/BYQa4RQXFPmqpuU+Mg/Ym3C13dbeQUQ179mGjQV736EJt3li
         0zdQOkXpzMI+1lqGM1JuV8n9QDiZcOaHhz01i6wLeJMIyEamUQLxEIltNXjUZ0YI8ZJ/
         QvoGsgIeKQKpsyJcO/4DgscTrAg2hJRpdhI7yFH/FQDdKmELzOChyTlPHi8MoX8T9+Sj
         ZCgA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/7XyUOMhJ9InpgdmC5ApXycepkSx/YhLGBEMp8BxMWHOfjx3zItK2Q2xbULwZFCyr4UxGd3qLjr4=@vger.kernel.org
X-Gm-Message-State: AFuF++m2gXerw+FuzJy61asNkpx6JECJ7f9vAAKjb62oC1YR/jtpX1Yb
	uZdKQkck1IaCl1P8DkfiAONM89gn0uukELuWV9pAe9i9uSrsQVtK/nYS
X-Gm-Gg: AR+sD12yTD/o2Yy7YM8HHMZRHgbVK8DUQlT8SP/YCBT4cC5VirNyKASFeVRHwF61MeS
	Dt1AMxYqNZfGX8kUc/Uh4SHy09PLMqzekgpaQokx66Hd89ExZmuK3MVeevYZQvKZGCUsGEuWmAe
	hN9tigx9GqXr+wGvBYEbisCpRfCWzmc8byNoK7yMUFjuHHE5tFQ+cHg+gu3d6iV/fOpTbhEHIVm
	m2UiFT+LqX+mN29LmtPWr7CuagIDccLZ+NmWzCqJJnHLXd8EjbPC2fzpBvtXL4A7GNx5BvR8dE1
	7DZV37iCNmnq5LBstpqrLFb6FXtaHWt73LtrxZrdTR6k+LvN/tMsznrLW65CHhy6VQx7qI7YmG8
	ly2HniIXS2Q65du0bCtj02KqkYmrh6JZKM4qLs+61z7mSANAtnoz/ZRGLQ7WG77gcQR4CEiZCvK
	Q2mscVnmRzaYBMLMvL66kWbRCWJ+hHCSIZjSwms27jXFPKPlFyEAvrDqeT2+VqFIpkh7A=
X-Received: by 2002:a17:906:6205:b0:c1c:2173:d412 with SMTP id a640c23a62f3a-c246a39ef9emr1883658466b.1.1787432609844;
        Sat, 22 Aug 2026 14:03:29 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967383e5sm461503366b.45.2026.08.22.14.03.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 22 Aug 2026 14:03:29 -0700 (PDT)
Date: Sat, 22 Aug 2026 23:03:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH] r8152: simplify loops in generic_ocp_{read,write}()
Message-ID: <20260822230326.5d642593.michal.pecio@gmail.com>
In-Reply-To: <20260822202155.18632-1-s.shtylyov@auroraos.dev>
References: <20260822202155.18632-1-s.shtylyov@auroraos.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Aug 2026 23:21:54 +0300, Sergey Shtylyov wrote:
> In generic_ocp_{read,write}(), the *while* loops look very strange:
> the last iteration is executed differently to the prior ones, doing
> some useless assignments before *break*. Move the code for the last
> iteration out of the loop bodies, dropping the pointless statements
> as well...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace
> static analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> 
> ---
>  drivers/net/usb/r8152.c | 67 ++++++++++++++++-------------------------
>  1 file changed, 26 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index f61686433031..de9738bdce85 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -1431,27 +1431,19 @@ static int generic_ocp_read(struct r8152 *tp, u16 index, u16 size,
>  	if ((u32)index + (u32)size > 0xffff)
>  		return -EPERM;
>  
> -	while (size) {
> -		if (size > limit) {
> -			ret = get_registers(tp, index, type, limit, data);
> -			if (ret < 0)
> -				break;
> -
> -			index += limit;
> -			data += limit;
> -			size -= limit;
> -		} else {
> -			ret = get_registers(tp, index, type, size, data);
> -			if (ret < 0)
> -				break;
> +	while (size > limit) {
> +		ret = get_registers(tp, index, type, limit, data);
> +		if (ret < 0)
> +			goto error1;
>  
> -			index += size;
> -			data += size;
> -			size = 0;
> -			break;
> -		}
> +		index += limit;
> +		data += limit;
> +		size -= limit;
>  	}
>  
> +	ret = get_registers(tp, index, type, size, data);
> +
> +error1:
>  	if (ret == -ENODEV)
>  		rtl_set_unplug(tp);

Looks like it could be shorter still.

s/limit/chunk/

while (size) {
	if (size < chunk)
		chunk = size;
	ret = get_registers(tp, index, type, chunk, data);
	if (ret < 0)
		break;
	index += chunk;
	data += chunk;
	size -= chunk;
}

Then it could be do-while, because we know size > 0, though
I suppose compilers may figure it out themselves anyway.

Regards,
Michal
