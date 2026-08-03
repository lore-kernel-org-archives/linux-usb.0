Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91922314A8E
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767991; cv=pass; b=sTJ+RRNmkWBogTwjeM7F4JOXxlfPncs13J5VKK2zOEqeNvzmpdHN+enXKQqYl2tklVjMPU37VIXAYosh8UqQTSbzii8k67+RtMj2zJn1B4p3JycJoft15qe12Iyv23S0ecfae0w8iDzpaiHTx1vSFPnpltHpRx+pdwKBmgVCCqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767991; c=relaxed/simple;
	bh=CN2tqOeF18mqBmxa6FYRH35DCRAH19HtnfFGMYWnYXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpBUe7DFjLpBAGURTxG1bfDR90c/zb52i7Ek5i8QV/PflJLIFJhIjVsNlxrNULJDT4mP+p8rCemjeyjfNmPCSbM+5VOng1G2o2Gtx8Ttfq+eYj72Un+uWnyn95aoSuvft4DqbP9Kwy5DijcxuABEeQ42izEDhugL7JMaiuoc08I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n04UzDFn; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n04UzDFn"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so2889110e87.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 07:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785767988; cv=none;
        d=google.com; s=arc-20260327;
        b=iIWfoaPUtbbW22WZhnSMyTHZFioyW7+Tk+44i0LIWI7DAqLmqVmpBpQDnDTjR97XvI
         V2xOvDY5mjBQ7jfomCPTc5M29oER3OVM0QpcbkBx1vNt1fklCoaSqW0aBSIQjmAO5oNG
         Pl38MQHREKPd8b90N1+5EAYrOCZw3su7QGPe9or80vKk9Jq4qsyBkVos/vwIRtHP07ri
         4llmAkDjSnmQorZnjjxUW3lxKsTfRp0BTUac1LXRTwfbNhjwYSPH1t+YtRny8foOPeyw
         2iEx0d4D875t/Uu6LTD/6OHZ/zVy/jf/TdFbvmW4Aq8Ff1KRxPnLWQZHStaioChTlUyR
         6XzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CN2tqOeF18mqBmxa6FYRH35DCRAH19HtnfFGMYWnYXI=;
        fh=oALaGJ6caCGGD4NT9YDcGsOZJ7kDdvYv7GZmcxASE5c=;
        b=qYJmbD0qJP+lNTGOO8Rc9aLAH4TNJOj/LSVGG5j8z4fslgpQTa8ZiW+pD02GGkUlQK
         UcecAExNvAD8ejEx0MXY6IvtSRaX3TIfrXZDrns/5OY/L02amte4ioHR349URqWszcF8
         AtxWJbF3e0t67RQ6Wk8sAhKB3Nw2ncDpU9gOpPiQTnS/6KBkit8ZRcVQJV9Pva2BSFTY
         1UO69FtEBGE3hY9GFcEjJYkHTi8k9S7O1OOXveDS7Rs6QgkpnItMHBGg6Gh+THn4y28D
         wX5P0ieE0JSQnJAO6loK7d1EOYZ30lCY46KZjU02lj9BSgmwBScqXH72nxv/E8Toq39j
         EulQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767988; x=1786372788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CN2tqOeF18mqBmxa6FYRH35DCRAH19HtnfFGMYWnYXI=;
        b=n04UzDFneZd6D50JMRVNcbTPJZg5Q2qyUH3kOtk6vjf+0+EScPbKDiScsyCTMuy8JU
         LUqOUdzT85zv1GOhlQhDT/Eb7+jRWP6cWpQMeqIPnqdM6WgkLujM48WJSBpo78H6Zvk6
         1VplOpJFoaKkpQ675IEr5giLvEAHLEZvDe5zyjS/TQh0bU3EZp0XUOuccwz0z90jfScT
         TAl/wHeYXLkXfU6GLtM2AwWc1VKTjygfk6efmmrWFk3UjUFtxAgJcDwom4pEIfj1qLe1
         L3udC9TOwyzlFhFs4jp2g1lCIWZLCckMbulBrXGT7x36ib4/GJ00q7Kchl2MRgZX1sGW
         7bZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767988; x=1786372788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CN2tqOeF18mqBmxa6FYRH35DCRAH19HtnfFGMYWnYXI=;
        b=f4HUu2vIbB/DVcwaBlQPxOSkt5+bU/NJ9P81qKq8vFUPTo+wSc00TiPgodXbV4Bs4x
         OU8/w87stvsstdDVdSLdaecmabQ0Efm58O8Z7nVPiphtKGkG2/P1z6eRuIm7vN/A6JM+
         v8pHgYSMjnuU4elUcrKz1gyzyFerLjrywVTh3buTBc4c59Y27gzcegXKnZZIeODuDS4B
         Rnhf3zZ3wJfGnF6ms32uTZD7Gu88h+CYsMj+4QxSFiEV+Ugn1/6YjAiRFhnJOF9nwmxq
         Tkf/Cw/fEBh1KaLjULBdPN8itCXLLOAyTjz0AmwwobyaAEmrXjkcsxaMncEFL+oe/SFs
         E2dg==
X-Forwarded-Encrypted: i=1; AHgh+RrgUxBQjo/ZtWeXVsQxy5MDdyVzIHiWn2T7nyX7fX2JJIE2P7wjdrqrVH3ur2YtDK4AE6scxA47si0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP8jq657yHQQ1VPIpQGjwwGAOUl34cRp0JFYH/gqesdmyxFWv9
	YwM7sErx2y6e4yz5FTeO3Dc99wsP0xhwPW1FUNf/fbFRoXkfMWvv556dLlqXMVgPRXP9I6HNbWy
	Wr8zBfojZM0Q6kKb5CNICV3vXp6bVjTc=
X-Gm-Gg: AR+sD10pfeY+nWRg8uL2DeJyjlYAxCcXSS4FYZ0GwiwnxdV4QgL/pgLGpbozPFA57Mp
	JCbIieY/A6HT5cPVoCUFX3+p4vBnoKaUQxGfP5MKD+EDlBwGMOtmK+vVMqmhgk4+yNWvJu66ZoY
	+NbqwAO0biDQwg7LoHzEbob7e7vWbX6jj/8L31xULedtlw+UJqGK3j+nFyoo/HB6DczAtQg0TPB
	iipoUYaay1BSEiFn9yc1vp4X93/tHsseRxJxeoXRxwG3eromjEHcICDFc8cOHtZphk1woDnlpFa
	eflOXaD6cNBMMIz1SjMCUVRhSQ0uE5DjpBBXsHj6OshbcmDCTXlQgs8=
X-Received: by 2002:ac2:5469:0:b0:5b0:1b78:495d with SMTP id
 2adb3069b0e04-5b2e4f33494mr1391887e87.24.1785767987448; Mon, 03 Aug 2026
 07:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-ax88179a-v5-0-dcb9fea4acd4@birger-koblitz.de>
 <20260803073348.2190800-1-neuromoments@gmail.com> <82acabcc-7b98-468a-a989-cb95f620fe5f@birger-koblitz.de>
In-Reply-To: <82acabcc-7b98-468a-a989-cb95f620fe5f@birger-koblitz.de>
From: Yuan Xu <neuromoments@gmail.com>
Date: Mon, 3 Aug 2026 22:39:34 +0800
X-Gm-Features: AUfX_myjX7GDgrIeULe-K48CEOfoy1w7o9fv1P7L3dnRt5PLqS6agmUIH9ZF7WQ
Message-ID: <CAMdPb80_Y8Chkoo4a+VJQz3yPa5YkKWHvAvXYjb=06BveBjP6w@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/13] ax88179_178a: Add support for
 AX88179A-based chips
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: andrew+netdev@lunn.ch, andrew@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, hkallweit1@gmail.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Birger,

I really appreciate all the work you=E2=80=99ve put into this!

I=E2=80=99ll apply the fix and run additional tests this weekend. I=E2=80=
=99ll report back
with the traces and any reproducible differences if I find them.

Thanks,
Jianhui
