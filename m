Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9A050AC25
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650045; cv=none; b=PdXs0EAOzLuE17jlE0V00z1AB2wOAqNct77tocYhb90twD17KCeUfxtvZE8twPgB+EP2QMorP6SAcostbHewwlO515Rh8SzVpwg4G6CnS/bqbf96ViDK+bXcxzzuncFob7Gslt28FSiRxJF+jJPSmWRMvve98pAtvo+Kkx1xVAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650045; c=relaxed/simple;
	bh=vwgRYswkmFYVOj7RHSLDpXjS8/vNLNG+d/Pzf2YpRbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/gKAkodr6ka3aQFE2IHu+ywbZi/TW3oN1poO4yfOrliW1RB/xCdd0yS7VYxCUsbVQAgOIvAWipLezsTh1U+RKhVzZOV1i0TAICJviL9C4/+/iDQNPuAi5TNc1/t4Okc42oLc1talOdobG8Bd27KvuRG4VxooxA6WkdXcsWqcJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQ0AGg9c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYU1mMVK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQ0AGg9c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYU1mMVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789650031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ouQ9UMJuK7mTop0Sws+ZpuUFqnmqPSVJ5MDQLtIoDE=;
	b=dQ0AGg9ckFvXLcEiMeLqyM0AnHSU4twP5o4NRFCOx98Cqj08QgVOn3Iv1/GViV2wsv4KqY
	IX7dakL6wq0RydoFO7Cdz3eVK8jysK7xk1QTTp0+pDr5XIIC840yOmx3tg/+lBt0dQ249M
	gqZuQh05Mp739+JQimy2fG4UWU/Nguo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-BDVxLzQlOGKoO7sEo6wHHw-1; Thu, 17 Sep 2026 09:00:30 -0400
X-MC-Unique: BDVxLzQlOGKoO7sEo6wHHw-1
X-Mimecast-MFC-AGG-ID: BDVxLzQlOGKoO7sEo6wHHw_1789650029
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-486f768517dso613307f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789650029; x=1790254829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ouQ9UMJuK7mTop0Sws+ZpuUFqnmqPSVJ5MDQLtIoDE=;
        b=gYU1mMVKxpIL7kVEhorRkqxxcgyrl5GASp1nooXcYDHSkjUCcqaOXNE5HSK7oSDnV1
         7ZbyUbuhQiUyFL2EP9LJtB+pvx3uav+XVIMrI2xZRN2pIMKmnVft0tC7CnRuBTy4LTXK
         xQB7JcuIJ49HsIKOuVyfxWiejbrJK8zzP0qdyG3h4e0Z1paX42IuO13Eg40uZ9cgO1A7
         DTGimitjeeBb70bEVz9SSIQnxMuHwz/zZmP7W3kg04BTHbE0XBPJ04AeBqSkZ2N3kMn1
         AfTDkcU7LITdCgU1V4zTBev9c2k//xBDWNN0gAhLJKZ8HTAzedgvI/TfOQTuiz51SBgj
         37+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650029; x=1790254829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ouQ9UMJuK7mTop0Sws+ZpuUFqnmqPSVJ5MDQLtIoDE=;
        b=Hzi4JUNd+q36sTGN4Upzld6zW3el9VD1S66bQKSxVd+H7SQns7HCeugTYhyhzmZ1xJ
         TuGdDO8CiMVTLmihf5IIvhGhV0kb+Si/AHquZX/jnjrjvk7yKE5KnwcWNOJNfFOoOA+5
         aLtVB+0LfTpphSOJLp/5p1xnSwN4e4KgXt2P3o+iBT5jcbG6TOZmlnsyVT4lkomS74bi
         agIcr9kSI7HItZSS5QIKI04bWACo1O6+H/B5ifLknTIN9TL1H1gea8hJuZpMzfTIYoEp
         q6pzPcYjV3MW5ckh6yVn8dsdxpGxsnJKSVxD7UzR5wf5vFWEB7rdt2uhmI4gNYmYNVCz
         l62w==
X-Forwarded-Encrypted: i=1; AKwUvBxt6PbSScCfVgKRkmN8SOkhO2OoSXU7YnKi8l8WoO4KSmCgo9gEXmwFBpzNvK7N/22tsSsdxiR21K8=@vger.kernel.org
X-Gm-Message-State: AFuF++k3q+TLv4gdf0/zRj7/hDaHBx+iQlcMJsAFHox6y4ss2qvzV22y
	b4uf+5gbGoelZqukHXqEDhFVGsmhETigQ58RteqMTo3PS/XvRyQrs5+EHrYtuKGvvCjb1of44be
	fwoZO358n5rZJa3hXQTTD9TPcKNMkMA0lzfP8D5Jhitpg9xM+Gr5RWJMIlENo4Q==
X-Gm-Gg: AYBFou09+3JKjaKMcZSsI6/605J/X6pWMrNogq3nlR6RHMTL9A1MBk9sh8z3D9X6K+I
	5S9dUQT/G6bg7KtZfHG44gw/5x2RnL3gnAGsg68jt7QW82XO8GXxJKSVDWES+hAI3dDBZLC/Rwz
	CWtAEAzOjc0y5WtRZ05ZZM/cgPygWJCrDaeU+mFYNdCE3xTmjc+wCv9W5Ebq/xLm8JWzhbfZ2bc
	5wAPKnkv0WZV8C0ApojAZJHzvku0CpOeMpvBXeCRvrevqS/VAZFOQZu7FR8eo3q/AMAjONoMi3/
	AEEkio7K9WFCEVCEqguyIJCnccBWWonriMi4W0VPZUB1WkXC2Ww89MF1Eb3hVA7lIZTrL1r8j1Z
	M1w3WLnDS1ko3LeWgd8PDqhzoUmJyhQ8Xqie1nBaHFkh7/5jjQQD2xvOicIlUS1wtAtG5ss0p0A
	==
X-Received: by 2002:a05:6000:2089:b0:487:92e:c608 with SMTP id ffacd0b85a97d-4870ceee268mr16040965f8f.1.1789650028876;
        Thu, 17 Sep 2026 06:00:28 -0700 (PDT)
X-Received: by 2002:a05:6000:2089:b0:487:92e:c608 with SMTP id ffacd0b85a97d-4870ceee268mr16040713f8f.1.1789650027358;
        Thu, 17 Sep 2026 06:00:27 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm15323682f8f.24.2026.09.17.06.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:00:24 -0700 (PDT)
Message-ID: <ab569155-f779-427e-8c8f-1dc5315fb0ff@redhat.com>
Date: Thu, 17 Sep 2026 15:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: usb: catc: bound the RX packet length in
 catc_rx_done()
To: Aamir Ahmed <elb12345@hotmail.co.uk>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Peter Korsgaard <peter@korsgaard.com>, Ziyi Guo <n7l8m4@u.northwestern.edu>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <AS8P251MB00015FD7716F38C345619B56C8BB2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <AS8P251MB00015FD7716F38C345619B56C8BB2@AS8P251MB0001.EURP251.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 01:06, Aamir Ahmed wrote:
> catc_rx_done() walks a multi-packet URB, reading a two-byte length from
> each packet header. Its bound, pkt_len > urb->actual_length, ignores the
> header offset and compares against the whole transfer rather than the
> bytes left from pkt_start, so a crafted packet header makes
> skb_copy_to_linear_data() read past the buffer.
> 
> A length below ETH_HLEN is also accepted, including zero, and
> eth_type_trans() then reads a MAC header from the uninitialised tailroom
> of a shorter skb. The is_f5u011 branch takes its length straight from
> the transfer, so a zero-length URB reaches the same path.
> 
> Track the bytes remaining from the current packet, and reject a header
> that does not fit, a length past what is left, and a length below an
> Ethernet header.
> 
> A transfer shorter than an Ethernet header, including a zero-length one,
> previously became a runt skb passed to netif_rx() and counted as
> received; it is now counted in rx_length_errors and ends the walk.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Aamir Ahmed <elb12345@hotmail.co.uk>
I'm sorry, but no minor fixes for legacy drivers.

/P

