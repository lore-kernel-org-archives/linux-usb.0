Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186898;
	b=K4KXhZIXtQUm75ODpe68yfbuYjqQL+QRMmcoXUPW3vQp7CDB1Rr3Mj0psHpnGOtt4D0i
	 dYHGlqnaUe4dB8iAPrSjvePoPvCTOpgo8G/nJxh3kYYnqgT26k5cZi/2qNhwt/PDQli1V
	 4KzY2eEctQu0vJ6NYTm++ea/0rBpQUNnRlcWORpB6X+D0fA4STnnTC6nwE4U61O67BpP7
	 VmQi50jBpS2Fhy26tjgpDzHTWtPPPQAuY3iC0RQICp+mt8MfZlU6Kh+U2GUWjKVCaDa8M
	 M9vdB6LGSrxio9oRFunYfciHr5XdvZcefoyiwwiruYBBoIPxyb/VAluAPgTHxcqAdEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=a1raqnnGut4xynOxiwY0p1mw/MtwsmNrEMEfjzI9bPk=;
	b=Vc4WZjbv27pQqHJTz6jMnxu1MOsnh/LPuJMtbFh5pDNqUl69/6s7wgCGMaqDKiMaECTx
	 trDlaKTX3MWK7I9977j/AXLudV6yEpslCWR0I8AiqCUxC1Gu0MPQsFuCXsE+RwhzY8gzC
	 hfnGp/zTMZ6Jd+b/TvQLT+FOecbZv/JuQKMiXPoQKJRhU84EicEXRpni+HWrxWO1hNPtm
	 Nol4hGZKH8WV6bCJ1OHHYZm7BZ4Js6dkCsSeJ37j3vkWPQanoj8FbzzkDuBFq+FNy9p9+
	 eiV8thlishfdfQM/Uuw0dTibACdAXLr/CCk2tnfcn7exViW5NQkwVH3kSoBvhnd+6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nw2iieT6;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4087606A806
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4087606A806
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nw2iieT6
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso667785a91.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186897; x=1795791697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1raqnnGut4xynOxiwY0p1mw/MtwsmNrEMEfjzI9bPk=;
        b=nw2iieT6zUVADY0ray39fHYzAT9kH2gz9FKtZKveuHZrNp9Gj7Da92sUF7KBEb3qm1
         8cFoW2kOr+coqqXW19d9xm3X+DegN6RdC4dyEATwvfqCXR36HgV5VAeodwl1p5P/2zcJ
         x5vtmdT3YkWZ2DxgeGRkn0GkUb9SYzXzOsvaexaXMR+qKvwcV4ELzk8wqReb/sKbhHBa
         ev9iDIAJHPyIQlURYXO+6r+HWBM2MsVMz+MZ2qAkJxFf9MQ7AxJbM1pjww8j8GeAjKFr
         0rHreAY/UKOpEmnCiRWOxOQ8bVTkbpGeGWjAOov0oc5RNKC4cR7AwQjhq4/6720izgd9
         jO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186897; x=1795791697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1raqnnGut4xynOxiwY0p1mw/MtwsmNrEMEfjzI9bPk=;
        b=liVMo0Nq+xwAEmubc+CcBa6Rua89SMFpJOwjbGRwNpmPoC8Pd7M7M5OLBFbkzNZRK4
         tx/lZJdTvvY7FIEvqVQog+i6jmZ664CWSFR4CKuJrueoQcoavJtdJYKTM/uGyWMON91O
         k1ZXA6gkRo1MOa8pC9wratK0WfpOtFngF3MckzGisi/CLVTPYKtuGZlEq7Ro4CAQ2F2T
         awNMAnZiBu3D8QBzKuDVcCnk6invDoeAB91taQDDw8DVl5/tVKnyFNcoK/xEUov4vzPf
         FU89eabpbOItwELKZ6p9OM1nQrQbzXt1TsRJLpc8XdC32q5gxX9qwmKJ7J3GV4WX5ipE
         9LGw==
X-Gm-Message-State: APuU4Z+QdI1TQc5cniOkqQDNbNh5zH7zdy/kEEjNFoII4mcydjDB3QCC
	JMw1JrWa8w17Vojtv3ZA5GQ5hIltPMVjgpW3gLW19z4HPi6tufszOqckNvVBWPPBFRs=
X-Gm-Gg: AZFdTZeU8//94hjRwgYoLgNZgWUtCOlT9dtIInCyYmsoSQVOQ4tWGBSao+5ka7MBIBh
	26ITk81VIoaKQi8yQVsOoQiiwG/sYXHYSaHV8Gz6hwCK5i5pYbhYztErZnpAPFswS0mziIyrvtB
	ORNojWt++AWNX7Y20aigTflpznZnfDlD9PEr4w5ftGsPIW0l1NuYPCpuzTYIlTzDk1XEP38eUeA
	t1fG4vRAXO2J8Z+SKLqj6lPcKxC1jJnPBnWUGmHf4GUP72YpMw7R0Bt7AXF1jBsoXWGZt2/vkp5
	HxnOznPQmcGGcclF7CjGeEN44vaijxbhL2RCzVYZEhkBCYyK8lXibrnrUlB8hsXQofUClwMex0f
	454Pv0l7/w87l9I6+jyDMHz1idnGcBJvuReMsRh3+7X2YGM1TQhV2acz0kjAatPuywsOz8KOrPa
	xGH6vVQ5ISsSuiTrhS/hNP03v9kiazltjCYM0qY1deMdSx/TxetQ2OffkKMENQ1tKSvuBIYihfK
	QDYtNqMxjh3wbCAK9YYrO5/+eIodi8TpVaZQUU4u3+5UClBXC2YxXQ0Py6FcmODk5a0IZ9hm9q8
	ZBqh4s8rfhWOh+aXlYxLchOElKKXe8SsHrdnvrY79enq+WWW3G8b2OhAnkS9W/WQSSxiY75EWXe
	4FBOyhZHsDBdyaHbw8McAvtpVlqoBHeSmIoVS
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr3266903a91.60.1795186897160;
        Fri, 20 Nov 2026 07:01:37 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm7652978a91.16.2026.11.20.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:36 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Sat, 21 Nov 2026 00:01:32 +0900
Message-ID: <20261120150132.3128382-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 12:44:22AM +0900, Yehyeong Lee wrote:
> usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
> the OUT request completes successfully, looking only at req->status and
> never at req->actual.  A host that declares an 8192-byte WRITE but ends the
> data-out after 4096 bytes still reaches target_execute_cmd() with the full
> length.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
