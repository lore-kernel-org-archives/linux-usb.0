Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7B530E82B
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791153888; cv=none; b=Nimd76VluKq3QJjF+JvmR+o4n8sJ/9V9bxnajch00u8s/QBbwJrasZYGG3UeTdWId57v0qPvF0pZ1vJWkwl0lTgW4LF3VsRzuO1LFlTS6GAO1dbBaodfcCCU769J3CFE9cnYFU/s4+54UyH8bh2DBPEQvTRyNOB+t0/yZsdMwcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791153888; c=relaxed/simple;
	bh=RQrQZVvWkrjZgbQ4MZd+PC9ooU9Z249UpmAHe4qG04M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XK6Y/PycZqXzQabPiOdZPm7mq5cQJKdm5pUlyOfP7kQlzDahsv3A881zfY4KWmTRRN4Ar5yy/zdjI7VeMDtj8+aLT6C8PFduCOHOjbzNTwpNI2K4/qpW120oYz1bFilli+Z9dPV9QBh8nbNvcdF3QnEd8nLPFb4zzynJzJyy6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3QuSwNE; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3QuSwNE"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48c54d65743so515499f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 15:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791153885; x=1791758685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lusv9musr2ttjnYRqCBgWFai9OjQZSC81iWtocGvUX4=;
        b=X3QuSwNE0n8SLMhtQLu/Cwux/TJp0QUlJGU7lVppNu2d5R4uWdjfKTDkqnmLZAJ5ny
         AAGCXhw+MWPPw94GN9HwU9SUd2Vc75kJeRkKonPmJHjeit8dKUDXcphOdzoP2i4kCsaB
         P56369PQ8mFl05vGy8x7nshaORw3/ci9rQWJdrMFBNEzf2gJXnI+B/F66b+Ruj2oHRnH
         ubDBobnOzwXnXf5NPWmOuwzx/3TJiPgil9UOCLRlFkW8MlvENU7jZWMOhUgMsGM7PRoF
         LKLQLRWyKFAxS3ke3dw79PxndJgUvEsclY2zmgAUgl6OY+cMU9mhaTRUIF3BWMImEkSZ
         7taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791153885; x=1791758685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lusv9musr2ttjnYRqCBgWFai9OjQZSC81iWtocGvUX4=;
        b=I1OQR+nb9w8zU7m9UWGF1FFubttlUQhTD7B60/zsLYz5ApLr9iBUaYJywqrCd4CRX9
         q7HXgF1++M20kEjGEzNuPNcbYVugoZcXd5jCjfyuYT7gwGtQEPaJgSO1yqJ7aASgMbyd
         7N/QIM4bklSXDJP6KScqCWhFoNVF8rh5Ve3FznKLBRntTyJSHtf6/5TG3yr3MJcxoteD
         aPF1OzbSi3vRCovYHYL5STDvpD4XM9vkY3VjPNNEwRWxkjFTGm7U+en+6/rh/1Wzv0Jt
         XhrrunrkuLEKHtuUwmPTySrv1FYd7jl3z6T7uD/PZbEYP40XUYYwKZvoQwhOF3lsAs/C
         Uo8w==
X-Forwarded-Encrypted: i=1; AKwUvBw2ricJrFu5jX+uWLWdXSTqK9vJXIey28LgKfXMl052AyJb1nGSv14koviws4s954w1HyDb9iJQA58=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmqjZpVUJn7DO6RPu8XmICZYnaXu59gc4QQ+YDi7cL9JUxSPvb
	NCFXHxE60krAJgiARc0JQ+vR4rC972EQwcT61zwFKrYRkXZhAzW3f/Uj
X-Gm-Gg: AYBFou2soKGJSUJg8zGtTJ3HXjkwaZVZCrsk13megNLO9znUyPsWb5BuXh4WHx+jpbU
	LgEYkI+FnQ+FhBgNc0xUOTwR7CnLu/YA0YSeA26vWwb5O/Uons/zGgNJLxoZ0PZbR8hq/r1AWiB
	s8MId8efKUA04fbe5kQT5brYm442AJ+oMR0AWlkuR6xuUQShAwdXfoKn1Apnb2OQFBIzDVp+238
	N6xG8LKJDpHKw7IxKDYRRPMje7HiKDGfpNHcgGLahLhyIStrgyJk5FDewGCTqzdP8nB+8eEby3b
	AO0mM+QhSBs/kaduaLqO6wCFskKtk7vOgZ7y9pHKb2AT9pVv4FoT+etwED8VUrQ5KEzJwXzd0kJ
	OzEHUigGq3W2I21QMfB+gyYUTzGkVVp6uiDHrTCISnEdTLiOcEpSs+3MwGbV6vdu6RDy4ejsj3f
	FzVnF8QoM9MPov10LkiNh+S+aN3aQiwdzqNxZWjFpozy35ObkkBziZ/dgDP3kpGG/D8W5aZksTE
	yYo4ShK
X-Received: by 2002:a05:6000:4312:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48b12720405mr15518616f8f.43.1791153884706;
        Sun, 04 Oct 2026 15:44:44 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c57d927cdsm5985325f8f.6.2026.10.04.15.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 15:44:44 -0700 (PDT)
Message-ID: <35882765-2f65-474d-ba07-3f7642bd1329@gmail.com>
Date: Mon, 5 Oct 2026 01:44:42 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, oneukum@suse.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
References: <20261004223852.312487-1-omermetekaya0@gmail.com>
 <179115379510.1402591.18007585712452116262@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <179115379510.1402591.18007585712452116262@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/5/26 01:43, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Sashiko pointed it out.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Theoretical.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
> 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

