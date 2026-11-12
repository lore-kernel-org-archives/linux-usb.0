Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448606;
	b=qquV2iuNa0ERF0jRusCa3KbOW7qMkSFZborvux1y7mv1ZyO+YTe7Mfa5jSUse4LsQg3L
	 3lLRrwxXrR6NAEkqBZulxacuVf0AM3h1uni3KYXmKEE+RL2chN5gDl/WM2pjKMwlG4J3M
	 msaG+YYneKbfn45/sds+XInu6YoWg5lgzQTAa3MS6OvIdf6oPgxACUsra5d3j78lr9BZg
	 TP/ANT5x7B9VhQKAY5Z0oZoy+zC0x7Azst90XahnY47D9qis4uPeFNXvMGd1GTAkOVaDo
	 V9DtZqw4wVG7dF/Z4A/mTRpuoqwKHZUs52gH962lk2sO6WUfPJHtewdWEKVva0sdEqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6oWK0y1tjnQoCAjbYtBhPA366Lo1NXdpT+rZkHBkVw4=;
	b=5nPY507YMm2Z7+GXA0shmEvHQhn/pASRu7ve1zWK69NLWQcfliT+jTO6lnt53tKEnHrF
	 Io9Vsn0rVzdp6jSeAd0ShDlPcMJdfv+nBJyoGU/MZa/oAcRWXwaMtPSSA1f7CXA9qf8vN
	 qiSg81s+0xx4pVpkIckvdxtjFF3VochFVMSj05ujUM4f6wfFQdbAANV4bpe30ij7p6juJ
	 q0jw+OHdqBVWxvC2v31cU4zp+1lFIajumQ+RCmpO91qDHJPC5rTejf2eWJox7msaFKYUZ
	 BaGtDwq/hGCXMLzWNjxq3OcNnh67gwd9jtaxFlTpA/DxCUbMpwdY5/fcbgjGw+8BdBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ythwGUP2;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D7606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 01:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ythwGUP2
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37000e7234bso3098769eec.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 17:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448605; x=1795053405; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6oWK0y1tjnQoCAjbYtBhPA366Lo1NXdpT+rZkHBkVw4=;
        b=ythwGUP2tHC4I3Bh81T+Uay+Mb2Vz4InI8ORw3NkFem4O7+BbPrCRN/sG/oqNhdXpn
         aIJbJ40t+8DUO4GE2CoCuOIId1nma9qmodDjDC6HEfp/nEDLftXm4IHhgqqjlV0nhSE0
         QVH7oD9S7zFY4E91haRClRrrOM1xWueTKXjFtha4hwpBS0PzW71xaLugp/wkHNjhX5Zi
         9s+gwvhgZmhIbLPjNKFS12ULSbIW6UawtY5YGCK9NqHuOZ3qaDviVIZmJS9aR4BpPzhe
         QwnGO5qvc9gtdm1aqAuiF+mdElpn0HKM6tGu4SmYF7C1ZGuU7KIxBdZ8PfbV4eH5TNxj
         h0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448605; x=1795053405;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oWK0y1tjnQoCAjbYtBhPA366Lo1NXdpT+rZkHBkVw4=;
        b=IFLnuE7YcWS/z+ckXM6XitsrIsvZ6e0gbcV/5E3AgNjrQOtQhLw44c1xNTUQNrr8qE
         DlZZLWtv/6z5UMsJr3cbNk3tJ5+hI1wDYlnxtCd9zI/oBnRv9ARBVNjAd68c2s62P9EJ
         HMpMQwjzo0iVHpw5HYv7Vj5wWTKOSeWGxOnCCNLTB3ieoCGgagirPOnMKszhMeIvl848
         LGYxa9z5moXTbVlJd2j6TUgftqq9mGdcKwN8tqvM7xyCiy75ri66XXmDUPVGNPzRx0Ls
         kIq/nKDAn/7f3yqxMP/LUku8i91RkkPcNwtOGmQdb4l2AmgQflOTSb/O6IHycZplyMJA
         VyKQ==
X-Forwarded-Encrypted: i=1; AL+hErHEW+eECPHPjUfXt8U9oe4w7lcA3oet3QCttxX0pa4vEbCK8R9MiZOwgHdRuZybcQPb+fqDGoy9t1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TQvWG8jxFRhjixdc6Eq3C0OTJIo/h1IZKrARAPOdR/53/tXOl
	OzuFvFyCXGMT7QSO+4O3eCrPkGsD9klVGAUDCPDaPX4JLMVkaFMSmA75b5xOB/yB
X-Gm-Gg: AYBFou1eUzaoBvt6YmFjmdKeJ7bVKD5qStxTIC7GXEO/SgEluFAvPhkxQqEGyrisZRO
	Lhbjreo5mIZHsi9ZcFMmzPSDbGKY70PBgm5WhF+m41efI8UT4DainJ9bUaYIdyuirUri8wNd/Ja
	6nIsaxsLJBG/rXkGs/XE6PSObl3gU2XY5InKaiX6B674CWMAXKcyu2dgagBhBFB1rahZ+kVLIT6
	0DHLGPJSJlMl1scZtgHrq1zLgKRah5mjfbdCiEbir4JGX9HBERzOiao2uga81jTHdMnX98yWOXo
	tkHY990x0R/O67uS79NBCU/R3sYwZaZl6GYSz8MexPeJFeE8Vt/fDYaudBEf/en3zwtaVhOnS92
	w/qZJyyuWVgL99x/SWXKdOX/4LHEFwD91Y9qF22Y96/H/5vp6FD/Cm0Dn8uENA7Y4jljN7UJhfC
	5wgNoV7zOk4x8ijrhsK6+tY/7Eobilb+Tkyv2PRpr8T68IN4H5kVDw9UhveO01g/7iR9hdYM6Dw
	wYTf/oWkG9OKXF8+5/eXsYbiA2viT6zPx+fLvYVYvGlIkXUjOsCMm2WV0Z3dxvUWoBv06jxIJK/
	EXcPts/25Fgd2J5IMT9O2TK2A2wSw7Ks+/1PiGn4tyStFtdFUhSURdD/nNNzLl4RZiLQefYx8Fj
	V/heCuvtR13unLTnK+HPo5UNv
X-Received: by 2002:a05:701b:465f:20b0:152:3812:496a with SMTP id a92af1059eb24-1b3c0875263mr3989905c88.43.1794448604886;
        Wed, 11 Nov 2026 17:56:44 -0800 (PST)
Received: from [127.0.1.1] ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm21032435c88.9.2026.11.11.17.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:56:44 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: xu.yang_2@oss.nxp.com
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpci: quiesce the IRQ before
 unregistering the TCPM port
Date: Thu, 12 Nov 2026 09:56:38 +0800
Message-ID: <20261112020000.1001.yaohan@gmail.com>
In-Reply-To: <tiszwydkunhgdxmu2lucgxntzbcosncxxzrzgggudhtnvubkcs@lcllktxpuwrc>
References: <tiszwydkunhgdxmu2lucgxntzbcosncxxzrzgggudhtnvubkcs@lcllktxpuwrc>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Xu,

Thanks for taking another look. I'll shorten the commit message.

I checked the IRQ path again. tcpci_irq() reads TCPC_ALERT and handles the st=
atus bits directly. The alert_mask field is used for the IRQ return value and=
 the loop condition, but it doesn't filter those initial TCPM callbacks.

My concern is the case where an alert is still latched, or the mask write fai=
ls during removal. Since the IRQ is shared, another device could cause _tcpci=
_irq() to run after synchronize_irq() has returned. Without the stopping chec=
k, that handler could still reach TCPM after the port has been unregistered.

Does the TCPCI specification guarantee that TCPC_ALERT reads as zero once its=
 mask is cleared, including for previously latched alerts? If so, I've missed=
 that guarantee and can simplify the patch. Otherwise, I think the stopping c=
heck is still needed for that last window.

Thanks,
Yaohan
