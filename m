Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617256;
	b=jV5tflP1OKj04izg4MKVRHugH4XNDkZvNhIxNsNHvvXyoyGHtpxTJx/BJTVs0Am07QQH
	 NqHdXsE5lgcUC+Lji6xI+fqD1/d1mB6Ag6RUfxyKd2N6bTIA6l5zlphMZQX+4aBT5Y2pO
	 L+e4oArHaUDb/+h/Q59uMgyRX3Ytwy9DkEQfgCBy5Xq4gHC4SBY4CNrG6eFugAtxQhrpX
	 5gn30aTDLKbbv/MR8F0U+Cl+l6vy8xDaqYC6xFovDtyBk/9H32HwUGaPSORMr/yTw0pLS
	 Z1Cm3yEsGGBFSmA/KKaAnJsq/Q9udfpIZCOfYuRAOn6QiO96T3llQC8h/CuM2mPs2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xxJJVSNNwo3lBy+JEx9HLHLWgj+DbeQNPp/qofQE6mI=;
	b=wh+uO3L/fpbDmqA7KZikgH+wRKLYHBRahQcL8gf0nd0/zZHPHaUfL61ikL7oFCF/8kHT
	 zpywr+GPTcwe8oVk/3iVMBNdaXHsZYJZ91ZvWsT/6B1svwK7kjAnP1VUhLO2QV3szN9JP
	 Wqu4/G/GpvjhVZyblQfo9hxikgrtOryN5opHVyJRoNosdg556H/z8EW2A3JuMNR+oaMnF
	 R5VZlQ4uozALQXC85OZEn/J907YaHheNSaRJA0nQLxnb6eQo9VMUDhSoEkJhrAi56AkQC
	 0wenMoWLceej4R614zpSdeIkkLCJyT0kiqqypOViqv8+GRDSLaPe+6H3jPNcDL4v37A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D7gB3Q6b;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90E606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B90E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D7gB3Q6b
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490f38e9688so4123304f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795617255; x=1796222055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxJJVSNNwo3lBy+JEx9HLHLWgj+DbeQNPp/qofQE6mI=;
        b=D7gB3Q6bDh+RP1I86PNUMsdP0gQXykxJeokg9RnkIPnPcMu1SYoBIqlhk70uqqO2Qu
         NwWT7ZwbJr/P/N8PqMoi5RQq7LD+W8WLiOPdmlUJLIzDY61aw2FevAkOdMBQiuZwDoJz
         1fDZjz0QKsPDF6GhRb2uua57nXezvczAjwUqPopF9qDJKpJIMEyi5Pq5LOkcEoQiw50x
         DErCOttxpfJ5YcX0J0opbbJHS5+Yy4K2wLBEJWBL9HnegPncaMhLPGnkFwEtJLvO9eGX
         V1odmv110NSbfAcQb4UyX27cVUHvT0h+MxqBt5qeeMu7Rrdu3O7n1s5MDsBFmS/tnJF7
         BZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617255; x=1796222055;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxJJVSNNwo3lBy+JEx9HLHLWgj+DbeQNPp/qofQE6mI=;
        b=NR6tjsBM03RfcBPYFL6dy8LUHm6KMpUb7SweGvtajhyG0tiWI+UThCiAyAvYIcf3Br
         csfS5TAlG52pKElxXxKCr86qMF8T6B0sJZ35LmT9KZ0ye5VMAjrKgwgQthein7PqmWlx
         YT0SBMTomdOh4p3KtDLjK/ASppjj+V4dE2iXvqZLWa9cvI/Z8UXr2gdHwUoSSUoglfRv
         LXCaF+41VKirF83zhavINYsouE1Xsc5hFvfeLKvhkgVwcr+34yp1hvnaw/xhnCfHS+sI
         r6D8adsEgQbq1AGk8OgUZS7f3S0ezgGkHmVM9F3Huatp0kPF3jh9pDtV080luv/CAtxo
         ZU2w==
X-Forwarded-Encrypted: i=1; AL+hErHG0aEsuyT55O4ZXD0Q1n6rf04LFKG+xXgquqjl25dBjzf1u2d/yygzGlSxHa/fTvhECwvCzPIF5jc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N6i6HH4E7OPHMjmmjk0+P//kTYiCqS3ji9XARHFzdlqcnNaP/
	v4FMT9fr7np4XWC4EvF10VFUNEPs5H0gfOXrV0tMbpVQr+09L+t6/vo6tm161qamJBU=
X-Gm-Gg: AZFdTZd+fUczQrtFPU0v6Egc/FRo7sAAmBF2KTkQc14bFZLishY4NE0zb//LL84zvaV
	ayp2Z4RPs10hABWm5d5eHuRs6+YhLiD/4NbL+JBazROsjJSZhzqZxMCyk1huHKFbjwnuHE3fQOD
	Dygil7VjKEHLV3Vewyjn+2o3FYi1zqRjvPtCSO3+fgpObSD93pys6huvevif6Ix+Tx4AvEIZptg
	QnOFIO2mqeX6qBKIlwBhB/6koPENl0oh/n2y8X754NdqLr0pmiQDgd67S60uvWPbShIpIMR/3CK
	1N14GGo8B5zit5Sh7QKI4CWqm4u4z6yY7RJA74QGxCDw3X/EKdLcDrC+I/t1j/vJR7zQzT36L1d
	IuAL7KSZ1xK+9YrhM4PXbANL07yyzvXDUYp+xnttYjUkcr8nCGlTEHYic810pojqbZvhwXP88cO
	CiNmAXv9SdEMkRQdaGh57eNaSaFYIPa3mygVRhdFMaaKwelJPHMGPRsIIhksuLxrl0VYcuMzjCp
	CP4+WGB490ksP5nC7bVkcZrWNsF2VZV6G1Y6dWmFhCgGuZvkYsK1HxG86ZkgVDbP6Yusm7alKQZ
	l+yAYSrAaViSYlyLVFqdqPxdNDUhgphEmG2ejsaDBOf9KmTMqdZNliJXD9X2FtYGjomcPh+qbjM
	Rnsonn26VUA==
X-Received: by 2002:a5d:5e01:0:b0:492:2b36:a149 with SMTP id ffacd0b85a97d-4aa59ffe3c1mr43267193f8f.25.1795617254808;
        Wed, 25 Nov 2026 06:34:14 -0800 (PST)
Received: from ?IPV6:2001:a61:133a:da01:7767:7f7:9a1:80e? ([2001:a61:133a:da01:7767:7f7:9a1:80e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm33563359f8f.56.2026.11.25.06.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:34:14 -0800 (PST)
Message-ID: <7b4f33ab-088c-49be-9b64-f8abb808ab29@suse.com>
Date: Wed, 25 Nov 2026 15:34:13 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: microtek: don't receive REQUEST SENSE data
 into sense_buffer
To: Alexandre Becholey <alex@becholey.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20261119084526.535901-1-alex@becholey.ch>
 <643a71e0-7347-47f3-8cad-ce31f76cb8af@suse.com>
 <AP57iwtzG1Kr6EB4hY7F0Hd-DaLhPZJzxoKNuvDpeiAKZvyxsddI1fl6kRKAc2Xg1ox0kL-KAdNYmZrRMEYN_mZRamfiV6nXjdcfDhJhGyY=@becholey.ch>
 <e3956050-8b80-4270-998e-2e5ec70cbdf8@suse.com>
 <8iDv29vCFEOxycORJWCZZoTT9dMFbUZZ9VK25sT27tKoWWtaKvLKZaW2YoQDygTrSRkZRE6Pu5PmkMFLl-PDCWXI9n1l-LSB9aJCByn8gks=@becholey.ch>
 <f9715edb-94be-47cb-8bf1-f84a3323f000@suse.com>
 <HSkiYehoEZjHsmtOkLlo174eN2wrhaDGyLpIMwWTMy0Cdn4t_nrRvoS0dslql-VSF3jaeKvglXyGaJ6OxnGMs_0TMQVXRUFDK1IDH7yjR58=@becholey.ch>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <HSkiYehoEZjHsmtOkLlo174eN2wrhaDGyLpIMwWTMy0Cdn4t_nrRvoS0dslql-VSF3jaeKvglXyGaJ6OxnGMs_0TMQVXRUFDK1IDH7yjR58=@becholey.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25.11.26 15:28, Alexandre Becholey wrote:

> I understand. A fuller cleanup is more than I can take on right now.

Not a problem. I understand. It will go to the long list of things
that should be cleaned up.

> So I will send the v2 you agreed to: it only limits the transfer to
> SCSI_SENSE_BUFFERSIZE, so the device can no longer write past the
> sense buffer. If you would rather not take that fix, please tell me
> and I will drop it.
All is well and I hope you took none of this as personal criticism.
It is not the outcome I hoped for but that is not your fault.
At present we have a security problem. I will take a clean patch
fixing it.
Thank you for doing this.

	Regards
		Oliver

