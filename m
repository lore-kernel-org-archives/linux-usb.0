Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94AB438014
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646670; cv=none; b=V6+N+iJ5564BDk9phex7sVVZrSU9c5XKbl9OMBya0/CQGV992sOCjNS48QRJNwsrGHI6ENDXwywQasd9xxziwPoYc10+YzcMf8WnisB5xTUsyeCY96Y66B0uhdmdhxMpw2A1E20WXDPc6fk+o+Nw73582ec1N0QE1oLzqudcfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646670; c=relaxed/simple;
	bh=8OjxNhHePidmg1fuKU7xo+rrS9JcoHVOhiq3oQjVaNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVs+vnH9IijM5kfw6CtCMBXByV3zUDw9YCBqmAC3v2TsqrO8dwebbUC9SH2//f0xCXIxWQr9Dau9PbDLgK13PmheSluE3vrys+UiRfJEjY/re6gvsntrLWNZBQE7xmWplE4lh5+8A36LPddHwZR3Xkosvy0AjMn2bF8Cvm3/xR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FniQsQLY; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FniQsQLY"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a12ffc112cso2366871fa.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786646666; x=1787251466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OjxNhHePidmg1fuKU7xo+rrS9JcoHVOhiq3oQjVaNA=;
        b=FniQsQLYwhWoN1mHzIYGxvJ4jGTnURfb4d/1cKpQ+viAK3QQQXrgdj5Enj1470qDl5
         Xhw1ZEqorPiqYbVrlp8UALQ+Dtl+pClo14Kbl4C4iWHW6BT6t/nxIGMAgsfCTjZ9Fr1C
         vYYAWSuiHa3ThCxoysvbGJXUDBGZep3V/jo4B+sG6fpREdRbXL6Kbiv42EFNo92OLzlV
         1Fzs+ZjJ1NyjV/5o+lRtQjGf2W16KMz5wit57/UH0GrV7YPx0Pxb9kFb2zWkct20RVZ4
         Eecn+9dRpUFjR+QigUd0BqaVtG4zUZfJKxgpgpCpT0dOJy1HD32qosafhiC47v4isduQ
         +kCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786646666; x=1787251466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OjxNhHePidmg1fuKU7xo+rrS9JcoHVOhiq3oQjVaNA=;
        b=Lb5E10mHycWl5m5vV4+3ozMLIG+YWttRF5WwB2ZY8F/4lyITvZj3557qDDJ4LQTj7C
         25vzfDDMT4pM77+57I9LGHHsUrqu/bNC5JUjO2G5UcYGPyleZzEsCh+56LirneIIHhKe
         roOHqusjGYVVJAwzriV5ADr69xsCkIqpKUBYRPx+hdP/XHPsHqFVSJYWt6agBjP7s/JU
         C1hfV3sea+lI3+wH2UanHk8bAbVokbQnhajB8L7mvTTKJDxFDON3S1WJzbIohCeUWBAL
         +0rHN89lQYylK4NlI7joLSuqHK1ZIrkqg0c0OMYmxrL/ARj9aQZ88RnVFDnCC0lpHTHN
         InAw==
X-Forwarded-Encrypted: i=1; AHgh+RrhDnc8DKZUUF+xLK14BGNy2S9UJIZSKhE0YKkd4H5WvNBRpZssXnjm8h76ijXIkxj+ACX1R53YRoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpyYoqMBNHqss+FkyThu4VQFiyPKpa+qLhgWqyfR8MB5A9q8uY
	zggNCen+ih7GHHjPONRAC0Pn/hVkkwty4teEiQaXWDKlB3OhlvzxWG9I
X-Gm-Gg: AR+sD10wQNul/UfeKTUHJZUub7jl1/oKAdCu0XVb/OdyJ+D6ib5G4fNQoVuRS9GTTv1
	2F4rLN6ee4aNABUzYMV4tnXp+aFI1BFjN948MWq4mm13zO4Tf7nosg5t+/BjbjH0cmrnFWiJq0W
	LHP1G6AqtokFLsjauyYriE7O+KiSQCNc+uxkfnTy+h1c4EJbUPHESBBKz6cNYTfjAb7Nt7k+lbD
	2AciiUVFTR04D9W9uFpG5qTVnVaUmnvaqifcvZT3bmRRhvac2Zv3Y8x25w0TzAdF7coC+jrPwUR
	wH/3rvapdFqB0qdq5XF2fOlfVHfoSB2fZY1x3xwf96F3SRzOf8pNCPggjmmoTcKsFsJHRzKIL1O
	6wbvGkDJLBTkY027vncI3ag2lGqM99q2MYYTUUzQU+4ixFAuPD2T20OeVLWVBxHvVxpSE7z+vS9
	OqsykhQXT0d0OssMX0+HfU15jIV0NgzUywXcCCzwO0WPa0Ew8jo3jrxp+pkjr7coOYbkFLDs777
	3iH1tIEI0JqURtMG4KNDNnn4zL6l2hb/8BETqv1thx6PyAywnkV
X-Received: by 2002:a2e:bd12:0:b0:39f:af21:75d7 with SMTP id 38308e7fff4ca-3a11b9206d7mr11997201fa.2.1786646665697;
        Thu, 13 Aug 2026 11:44:25 -0700 (PDT)
Received: from XPS-15.tail097737.ts.net ([178.81.193.36])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cfa1dcsm1187621fa.28.2026.08.13.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 11:44:24 -0700 (PDT)
From: rafayahmed317 <ahmedrafay888@gmail.com>
X-Google-Original-From: rafayahmed317 <85213825+rafayahmed317@users.noreply.github.com>
To: sven@kernel.org
Cc: asahi@lists.linux.dev,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	neal@gompa.dev,
	stable@vger.kernel.org,
	Rafay <ahmedrafay888@gmail.com>
Subject: Re: [PATCH] usb: typec: tipd: fix VDO handling
Date: Thu, 13 Aug 2026 21:43:13 +0300
Message-ID: <20260813184313.405826-1-85213825+rafayahmed317@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@kernel.org>
References: <20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Rafay <ahmedrafay888@gmail.com>
