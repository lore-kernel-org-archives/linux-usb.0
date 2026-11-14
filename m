Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633430;
	b=DL/ykdmxTPkt4uu8sQNhdLVT4A2tLODkGsVCxAId1mhfjP4iReDcNAlEnMHjq+TfUqYe
	 4Pz/FTUjFr+hDhrn5g7s8HySpL23ZihzAHUwaxkXwaLPrGpFxTkVA0M6ouz0A72W+7Wmm
	 xz1VeqLFDMK3Mw4vikiLDTQGEg+RnmlvsT6oVvLxHKIE5nfGLbd4gCrKfzX74QuQ+Oleq
	 LWsubp02qiCAHOXBM28LNEydIZNRjrJnoBuRfo2+pHQyvQvgJfUpPXKjKiXPdyzFMbJf9
	 t/EFHTLLqvDySqjLLkSF4KXfB0FgJTt06jaxiTxeVP5nJtUMDPBVbaeFai6cGbWACIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ul/Mm6esIQglrdbTusQ43Pj+MhZ2aiFEr9hbUrD0IlQ=;
	b=O+jNnaNX+F0yTkHnwgARkQY9f88gohzfCrCrSTiIcrOn24s+fdSzMks1DcShiG6RVtyp
	 4mxxRsV8UdU+u7G9V7+JB7ynXzJNEwISIx5WGfCxTXfwmvEFV6KIEAImR0O+zgWQblELi
	 iyS1AhmefhlTEVeWta4eGHYcTmE3DjNOCBshUSF+XWEI8oIqxdniyWh77ilxGi6jNLpzW
	 G23/iZQrmOUh3AGeKACJXEQpQz4P5ZhpukiOVWGvh3kosbsfMk0rvUUM29Qj6zArC9GKG
	 8FkVis/LmpNaOSeyxB/vM/+OWwHgR7+ecl0NqwrGAca9ALEQb+0NteEHbe8cLN4BMzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F39Vog5H;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD449606A339
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD449606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F39Vog5H
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so2551152eec.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794633429; x=1795238229; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ul/Mm6esIQglrdbTusQ43Pj+MhZ2aiFEr9hbUrD0IlQ=;
        b=F39Vog5H0GYnbeXhGNAX3OElbOsU45zIwB5w21GdUbCSHbbxvTpYzo1RGDzRudecMx
         r33rYXY5+agZRNp7dhPjR+zgwJrLxh9x1CHGXUNAWud/1Epnl6mBbnaF/K2aWnlyac63
         L5nkkKWJCCI/9pHMcWU9xcY7ZI75cbEc0W0rmWu1jwv51NKzn0AWJKKTcGykMkpHJLo0
         xqt9/Vp5CHJPkI9wQnFw8tsbfnDz5Eo2Wc3Qgi8n4JtR3Vmw69VpgtRYXCDxedMv40M1
         XlQ3nOyGHi4L3+7VPTyU00aHGg0QyBq2uD4TTsrQZfViWiBk7dG+D5P7nI/U5r28fInK
         YU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633429; x=1795238229;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ul/Mm6esIQglrdbTusQ43Pj+MhZ2aiFEr9hbUrD0IlQ=;
        b=FPnZwkbe0XalKKYaoUaMV44AcdKHnVCMuPUuYyDBFbtSYYiLIz85ZH0psvlfYzLeFD
         h8TzmuNnmFma3mJ0rOLDF4JlSptpWeH6uMWXr3q00uXbK+1SJdmbo1htPJ/Jq/WHmIWl
         EP7NWzus5EzPc88xJD9WZaG67vZTkKQIwUNeo1Unzy2L1U46LrN4Iz0IM3qyXu22dHKA
         3HglM4xzNc8Dft8B4tchUy+fFZZmGXQ/KexixHLnSeif9o8S21ypPx78AlJyueXfdXLI
         WwEVHnzi3hvdTaBE//IW9bLC4MsRXVlVCRkNdKrhc7oUFxZcNbF88TeiRi294lwDL0TS
         3Nyg==
X-Gm-Message-State: APuU4Z9QuNc3WqN/nLEd844DVqjM4Wm06RzQq5TZYxlFdnWJjbY+XgPn
	Nf+UgQ97coXEhI7UN8Sn6lu2v4FcMyXfKC32wR5PznUBxL0TN6Puo7bg
X-Gm-Gg: AYBFou0K5ZfG7bWtBNzHc1m1Zf7USc8k+2RuPSXMAexRqqZLj8YXk1EC+EH2hM23Z+Y
	Kfz/JFMpWSOlcjCBswwCts1rx4e32vwIf9bdTC2O9dljtwZCb2J95YS5iBueX/7EuzA/ozuV2dt
	KSwx6f/7L1hikwE1JpDomKGui9A7JR4oyS7JV84wUZ2kPqJKyDPFvUZrNeIbIhh5z8GfeVY+xAW
	A7v1hgX2SzOBobuZyDAUeAYm9MdDCcvQhhPA9qPrmMbdm1Ugcz1CsAQ7xUsNaJMB+0XyEAkq/Tx
	3hz613sk7vzmvQ5niBRzNopurMejxnH4lNOJrxkXnoNGuDo1zOCVzM1I0pJOqS7WgUWTTC94HV5
	gOj8CaDizecIXxWWRa+IyIsAwWpopZk/HgIlzazsWxZEI+TCi3PQ7wByCMlNFdEwtcD8Ale58VT
	/1NGsUMum6aFeG1hbZkpb3b5fiWa5DhcWjwFpfNYB6kBg/prkPXt7WmIsh+8P8xqs9VV4b9DcQY
	g1J96A5N+JvqO0J2XCrAw0C2BKhKAOHzLGUJyC4LA6gr9D3lFWhRIbLnWgYZTBDor37KLPeBNmo
	ibO0hitP4ckojtV1EuQV6cvoZmEf2ApB0OHpNviif34d7G7WUR8WV1Lgn0rkiU0qtAr/SXg5V9L
	2LcuFozLGappiGiDbEqpqI0Za
X-Received: by 2002:a05:693c:864b:10b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-37960384530mr4341028eec.0.1794633427555;
        Fri, 13 Nov 2026 21:17:07 -0800 (PST)
Received: from [127.0.1.1] ([2602:feda:30:cafe:ec49:38a8:0:1866])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm23500088eec.20.2026.11.13.21.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:17:07 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: sashiko-bot@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: typec: tcpci: acknowledge masked alerts and
 quiesce the IRQ
Date: Sat, 14 Nov 2026 13:17:03 +0800
Message-ID: <179463342382.425322.3485675052545000005@gmail.com>
In-Reply-To: <sashiko-outbox-212527@kernel.org>
References: <20261113084928.211885-1-shunsheng1218@gmail.com>
 <sashiko-outbox-212527@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Thanks for catching this. You're right: the v4 handler can read
alerts_quiesced as false, then see alert_mask become zero and return without
acknowledging a pending alert.

I reproduced this with a masked-alert test. With v4, the handler returned
IRQ_NONE and left TCPC_ALERT at 0x0001. The local fix acknowledges the alert
and returns IRQ_HANDLED without dispatching it to TCPM.

The fix also snapshots alerts_quiesced and alert_mask under the same lock.
I've tested it with a clean kernel build, including alert-read retries, an
alert arriving during acknowledgment, RX read failures, and IRQ teardown
under KASAN. The tested cases passed.

While preparing the revision, I found that the IRQ handling changes overlap
with Greg/Josef's pending "[PATCH 12/19] usb: typec: tcpci: don't act on
unread alerts".

I've kept their patch as a separate local prerequisite rather than copying
its changes into mine. I'll rebase and submit the revision once the dependency
is settled.

Thanks,
Yaohan
