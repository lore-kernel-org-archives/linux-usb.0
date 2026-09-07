Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604C4C0436
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795507; cv=none; b=jovaAs3K/N3tNcpzCGL9ysE1+vNThUZIDZW37LUqG+rxgdmygoMFSgTCci0G/TGSKOQIhGk98oaLcrVQBV7yBVk730Vw/ioCHL991n8+4HdEknkF/X9OZ+GM8Q/uryIASPHKfM8RSyw4dQFGwljtvWHEKr4bYFayQd5wUIQ/hzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795507; c=relaxed/simple;
	bh=8Me9QJYiCvVFsGys/PK+aOlRI9BVGsj5cSJOS3j6740=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiijLknSmvAt25XE5S2Cyr6kXkNMVHUR3bpB41T0XmfVLyrDekndIhkLPTq0Y8VbrA9XABdOqZ4P6wphoabtsFzHOuOBTbILcH9M78+vAl5iUq9jWbrma1zay8z/Sc2o41XZqLSijN8YHFOOVSliQSF/5jMlvWb096vnp6WEAV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBKvfQNo; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBKvfQNo"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c207cb16cf5so560902366b.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795505; x=1789400305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5gI+zE3N2euLaz2GylL/7/gR3j/SF0RPqPntFnG+sQ=;
        b=MBKvfQNo3NLEmVHRIEzVi9fiTMDDzUeB334sEmEZXbs7pozOCwkjHoe8Tvz8f/Y4am
         pWrcM9HKDM9FeTxKeKhxjohGdl/smYX4Jb33lh2wrBAwjuqaLIlL727MRQqDh9MS7NiX
         vrTebQptTmTo6YndmS9NzIYxFKg+Rqz9e3pfxb+n7JPInihaigyfVOZ9J82vR2xlUm/J
         W7e+IW/MFN8uhSHM28A2VubSr1in9sk0zFfJYo9z2y9Wlk0u3akg8sR8TVugUiq4Brfy
         easZ2D4+AuZ0iSRpkNTajVkynPv5mqyigwl/BN7S4npM/bGD8p+8DWjZ19YYtbOYxiEb
         hszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795505; x=1789400305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5gI+zE3N2euLaz2GylL/7/gR3j/SF0RPqPntFnG+sQ=;
        b=ex8ycP7n96gFND1stwqV4T/mfbFnyXoM8QM6/N+Iu7j3gOpoMpd2HVzHZxckWwegy8
         2Jpu6gIYp9EyjxpUEvgdZG/HmZD/LCLgLC4lZPGYrKiLwTR9RKp7cRFx+PJDL/KinRBy
         xx8P8CsPTXPa04LVl1uWXLgDWETMVD+Spy1spDQnMC5XhNyGsYndeTx0H2eeJv+xNimL
         AL+muqTtWxceCQoOPpvxnmnYfupps6XDmjfyM3KV01lsnQuzFUuyV8Pb0t5HOkfcqo4h
         gUHzPpxiZXKWGS9pEDJYwFgCPxpimXW2Kh7a0BfLwzw87bE3yQbLaJuoeRbc4eTzkZvz
         F60Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgNtx+kiGB35EHISl/BqQrkeB22pAf7TwKnHKNNH/bhW5e95y2P9WjC0dB+r2M4WMvj2syWo+MFqA=@vger.kernel.org
X-Gm-Message-State: AFuF++k/LjDlMaJ4dOVQamIjak9jU1mrOhN/CkqRq263PMgWYklGybh3
	zkKoMN9tQcbccStOacc7GarBo9sugeB/LNPYnJpfIBgIrsjtStnlKqUe
X-Gm-Gg: AYBFou3mJPFTpvVFS3AhDtXgD6uERqgAObjjkxGhG+HsoyEGrSrEbEDrtU/SoQna5AJ
	xSlsUgkSmI6bqSs+DxHsyJC249PzJKzApkz295qdJ0jAIe+bEsqcKMyjqjFnMxlEp4bsBE9Vl0u
	/Wcp0cN6a5CPFQmNGOBxIj0F+5not0Nqy05ScdFOiM47NiIX8YDbPAg6BlI55hL8X8A7gL7bRA4
	yoRaITClcLKNo/QTuY2rHTFAwVF3ZmsHqkzWo/0l8lBQBxOhwfPMO7ETvNTBgn7tLZsWGKh4VlA
	i3lgn2mIrhpNE+ZCh1nbGLfiMH/uZyoPWCArydYbxLQPKQWJUVsJyOZh6r61S/bsIPMTYsj0jar
	LM7tb6q9Gf5KiduCBay7jSQ3vnN6xVgm82CjvzhcTjHs7WF94VvBUK8QiLLZBxX0wpQ/ZbsXwV8
	6ChYsjnc4QQHUYYGNm0t8yxTl6I6DDci/odEGiaNTbAfhzoHwJNpWiILbO3DhiiwEt6hKU7iPU0
	PQY1D1yaG5nMnvDTmZXb+RfBiXquwRAySQb7YOgUY14Yo85WyM=
X-Received: by 2002:a17:907:d0a:b0:c25:32b0:e56c with SMTP id a640c23a62f3a-c260c69b38fmr867347866b.4.1788795504433;
        Mon, 07 Sep 2026 08:38:24 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm504779366b.58.2026.09.07.08.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 08:38:24 -0700 (PDT)
Message-ID: <743631a7-78a0-4bca-ac31-1ffaf3ca7d60@gmail.com>
Date: Mon, 7 Sep 2026 16:38:22 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] net: sfc: fix repeated word 'the' in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kselftest@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-5-hemanth.selam@gmail.com>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20260907044635.7141-5-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2026 05:46, Hemanth Selam wrote:
> Drop the repeated "the", reported by scripts/checkpatch.pl.  Only touches
> a comment, no code changes.
> 
> The bitfield.h hunks from v1 are gone: "the relevant bits filled in in
> the range" is correct as it stands, since "filled in" ends the clause and
> "in the range" begins the next.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/net/ethernet/sfc/mcdi_pcol.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/sfc/mcdi_pcol.h b/drivers/net/ethernet/sfc/mcdi_pcol.h
> index b00e7c100566..976a96459075 100644
> --- a/drivers/net/ethernet/sfc/mcdi_pcol.h
> +++ b/drivers/net/ethernet/sfc/mcdi_pcol.h
> @@ -9560,7 +9560,7 @@
>   * DMA synchronizaion. Always the last entry in the DMA buffer and set to the
>   * same value as GENERATION_START. The host driver must compare the
>   * GENERATION_START and GENERATION_END values to verify that the DMA buffer is
> - * consistent upon copying the the DMA buffer. If they do not match, it means
> + * consistent upon copying the DMA buffer. If they do not match, it means
>   * that new DMA transfer has started while the host driver was copying the DMA
>   * buffer. In this case, the host driver must repeat the copy operation.
>   */

As with patch #1, this is a generated header.
-ed
