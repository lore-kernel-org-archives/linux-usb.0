Received: from mail-ed2-f19.google.com (mail-ed2-f19.google.com [74.125.228.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044515540BF
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090192; cv=none; b=Ljo2fzCnigRLEQKxRrQdNpsVDb/V4HaoXiLyI+EIX3N2QiV2OjElPHsUE+ISGL9soCf6kbfi7W5jcM5mWQjH4z/CgqI97iMcFBH+LvwY9TRaUXuSJZHi4BuQ4M/BcN4wJEkTP25Kf8PtZ3RAoYIgOSkgtM+5/FRL+0FCT02HEmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090192; c=relaxed/simple;
	bh=xKlKdL6VvV16vgZm63eeXgdPGBBXcmwKTXy4dmtFrQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVNOMBZO/Xq3nb/1S1b+Rxn3U50YpadwuXuy/I9xUcLxmuP/VSf7VaJGMxUYnsYroY5rhBTwFNnjQ21xB8Zuh7AsetXC0STXzyyyn/kkKBo4ir+BKoM0uQm0BxHNFd53H/71mHb4e3OB8AF6dkensDbsVKuEJfNxpwyMNsBpCzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ShgKDqYD; arc=none smtp.client-ip=74.125.228.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ShgKDqYD"
Received: by mail-ed2-f19.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so6824492a12.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790090188; x=1790694988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJwpSUnWGbpNE/yG/pCVt3+8bysd5TsbZbE12MOLBt0=;
        b=ShgKDqYDfL70Nva53TO6NgOZ3BiwfOT89WpK1v4AyHyudymdahdQgMRMPMAi4TFx54
         oRsqAtoWjr7/mnJX93/ecmbfGxjR2dUcYGfLSGU57qLpKqgO2M/I42lxwtNhYVPTf7JA
         NPR+sgV7BhuqLOs5u9uwIdqKXwbO1H2jOAzzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090188; x=1790694988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJwpSUnWGbpNE/yG/pCVt3+8bysd5TsbZbE12MOLBt0=;
        b=t7eBPFWUQhfM4fK9us1LZlVQe0aWSWVAbwbx7aXW46FjMiXGkVEfl1c+jtyvix/EQe
         KezEAvU7BMU6g8VsUu4oiIduPyfD4vqlmE1/HfPbfIPzeqcKy3OA0KVwkdC019UW33ju
         FRSN5QLHaTKTeFGOIXGVTFtwfv5KmGBw75DwqMCXu/z34surppv4lyFUc5BL8IHR0tKe
         K8IFgWQPd9KWjh82qTrdja+M2d6RD9cNY+LkCJ4lx1PrOXd2j6l7AMCCMph87xndp67c
         5B0YCp6sifwxPcErakhP4fqDD9vUcr0+MF7Do5vXxX/watK62BIa4wpOuWASRktLh1jg
         yK7g==
X-Forwarded-Encrypted: i=1; AKwUvBzfL7v2HTLQb002x0bkGZupUgfTPErRfpV/IBHK+of5D2Tx7cGxEgw8R6AN5fehRGiDn7x1PrfCECg=@vger.kernel.org
X-Gm-Message-State: AFuF++kjVSONzdSe9Iktsy6iSF3EiXgYGwZUj6nydOqBD0sd9yAJ0i2B
	iGuVC48ESH64VX94B2ojbLFH1atyV7frKivjI7nUnutkfZ4PR80pbXKQ+BZ346AyqbM=
X-Gm-Gg: AYBFou1uDB8CMPQH1YPULJ/CUxPTYvgtR0Z6nNy55HSjP+bc+YitZhfOSycUUPpmQbU
	tMurQnCLYfWokcqb6c4Nk6o1b5nHrE4ZqQvoqervMT0uVNDgK9+fWW5dXYcq6wKZhtCKjChH4k8
	rDKd9aTo3BlI1GcXupghCBO3TgrFapYDIQ89fkGHXzpFdr7Fg+51lYmKlvgX1C1mpIfDQ6bLBq8
	E/AuTCYvTkdVDt0udFftqiq/PnEASYVgCmttOWaFv8r5bue1+Gp/lb0OZKD755Nw0xv6RvmzRMj
	JMEaLbfFuGxGMFTQHnef1xbcn7ZWX8JyrCcQ4J8gCJ81QaWH9cakA49qcTvyAmF7Xb2W5dbd5Xg
	13AzvgzCm6u36RjLbG6fOt+uLSVkXy6IMk+64fjpHfr/IsmNWI9V3nIOGEt3L0Os/p+hlKKA0W2
	IJXsSI7r01A8mL5pPpgJi4wxXK+RulyZaBitbKfIIMa/5e/kHvWOXl4xqDuBF2viKGppSAjvfRH
	ZEi6s4nlYc=
X-Received: by 2002:a05:6402:20d5:20b0:6aa:734a:a095 with SMTP id 4fb4d7f45d1cf-6aa734aa1a0mr5956255a12.44.1790090188170;
        Tue, 22 Sep 2026 08:16:28 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa451f039sm1292439a12.25.2026.09.22.08.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:16:27 -0700 (PDT)
Message-ID: <5d635b61-fb5c-4162-ae78-c4c348bcb35b@linuxfoundation.org>
Date: Tue, 22 Sep 2026 09:16:22 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: remove duplicate "daemon" entry in longopts
To: longlong yan <yanlonglong@kylinos.cn>, linux-usb@vger.kernel.org
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260818021515.1879-1-yanlonglong@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260818021515.1879-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 20:15, longlong yan wrote:
> The longopts array in main() contains two identical entries for the
> "daemon" option. This is a harmless redundancy since getopt_long()
> uses the first match, but it is dead code that can confuse readers.
> 
> The duplicate was introduced when the long options list was
> reformatted for alignment.
> 
> Fixes: 92e11aef70fb ("staging: usbip: fix up alignment in long options list")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>   tools/usb/usbip/src/usbipd.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 3e22b651c754..00904508db67 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -589,7 +589,6 @@ int main(int argc, char *argv[])
>   		{ "ipv4",     no_argument,       NULL, '4' },
>   		{ "ipv6",     no_argument,       NULL, '6' },
>   		{ "daemon",   no_argument,       NULL, 'D' },
> -		{ "daemon",   no_argument,       NULL, 'D' },

It is a good find.

How did you find this problem? What kind of testing was done on this
change?


>   		{ "debug",    no_argument,       NULL, 'd' },
>   		{ "device",   no_argument,       NULL, 'e' },
>   		{ "pid",      optional_argument, NULL, 'P' },

thanks,
-- Shuah
