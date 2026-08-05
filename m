Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C933E008F
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913033; cv=none; b=NKXt3u91ldR62rE+IdVGNmUv9v6ih2k1ohY/HazYBY+hln3OCcZcrpJDoxqu9OzkOywKNNrwjBUPW49T+uNP5DeddJCEo6aFoDVpEYvOriEfJ3IbqrFoSgaUTuZRFKJ5ktu1b/MNDXk3S8ciQdx3Tx3UKOJurn490ocqHHWb6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913033; c=relaxed/simple;
	bh=NqSuU1HfvjNEbx15bthEoKPYhtn0uSBsaerZJdnUs1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TS12Ser7HS4pFVTb++WXmpKNVlAJ/952Os5jVLEOXkCczEfG6A6PK9odXBvVPa1soeXYKpgDRVyDKTGfvaNizGF70gzRwhTxTl9WEJkud3cjj1S4FACN8Ajzuf93Ac4iDnv4xHCgGjTPWb8uE3URAP3YgkRzKGCQqGFGMDuHNG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7vkphJD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7vkphJD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486672f03cso786500b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913029; x=1786517829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqSuU1HfvjNEbx15bthEoKPYhtn0uSBsaerZJdnUs1A=;
        b=i7vkphJDVpIiL0fqJPsw4EFXVaL5wwh/toVVGwxfDVIEnCaZBYIO8t1vONIZ9Fn9lk
         y1klGhh7Qx2nmzjhvnSbENpxletYHySpFTtTt9W6hiWkXEHKZ9jW+1IQCxn9VS/TVdM0
         h+zC+CXSi3rD5WJnZAx9tE5sskQ8UuQXqGXbMhKpgMfCFVnO+6lSx6YyboF/S7wT4ONs
         qtn1HVIJaLgz7EQ6LWXE3xwfmbLKbEQx+MSWRurHhQiJAhMUEk/1bbtstFbN0lNj9i4e
         zxlJ1o8UCrRSNeYisVvyLKhvm3KGdlKOO0jwVbRjYsRVL1BKwTynpTeB6e+9ORxoU+CA
         oA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913029; x=1786517829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqSuU1HfvjNEbx15bthEoKPYhtn0uSBsaerZJdnUs1A=;
        b=Hky9Ch6mRErQ3BQ2KDmfR/4n0khM56Ki9gm66RzXlOSZqjFGanU0fdoyawxDGjV8SM
         O1TcmYI11S19AffICo65PCDDUCqkV2cucVd5h2DpVyxokRi5yCyFKaKfRlTOHP6YLhSR
         r6RfBQliWfB02GJOWyDycVGMUHp5BW7oRoQwYEmBp2MkmcRcxeP3tHjRID5iPGBD08LT
         NtT6Q8pxYb+OJ8GV5zLiEhXp5P2/bIXcZYV2+6WAJUfDI60l21ZPMBRMoRh2EL1CQuyd
         AaWiHFilurU1F/KxvwXSGsmEyvR8+bc/Mv4hrgD0kUDyz4KcxkV21+nRBWRHvXS+Vh9H
         /fEw==
X-Gm-Message-State: AOJu0YzC0xNzHmBbi5KJl5RxC1aoYR+cdThZeuwsK5eqNT9J65/FtJZT
	R4/2h1jrUETyTtiw/Q4wZJh/xVMQskIKcWcoIOW/X8vEOxBgatNl1eyE8W13fgTR
X-Gm-Gg: AR+sD13dAorvVU4ZjnLZd9L4IvGjXV/49vwUFG6+hTG1fiWVquBosR/f9M56PbLebaZ
	IRikMVbhQ6rZ8lyvm6955E2DzRg4SB2W1zl3Es5vnlI6jvhaLADkzKE8ONCVZvSLRpdzLzS48pj
	KX8PRdXZ/teyq1h0Nktk5kGlEHvS+HS1ti3O5cmFzCgZVs0Q/rdZtrHZpxmOaWLjr1r0DWFOMuZ
	ovPDpgIpVctlLr3oVXIihhTDg6AJ8aQRFbigXrUb0f+dY/uxR2KyYnBW9ee3Tvcx+oidpBKwIhm
	ETo0uejlaYZ7JIquB6/AJaORZgUEYWaYqjoYzVfMhZKP1a/qLBjsHPH5NLfHhQIldPeVWuo1zu5
	L4cmYDaiswtcFDmaAH3HbfMqguzTHE5jkFk08WgvI+9qczuOEcMK+u3q8ynrhxuzz2kABa7EsKG
	eDQLNjP5e7UfdnEyC/Zn5sQ9laU4KVar/QOU1iwNiXY349Z/qrewDtxt7lXbMMKBVHjYTxbxSLz
	17oCJ/W5DDdBQ==
X-Received: by 2002:a05:6a00:c93:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84f2de6ab12mr4433240b3a.0.1785913028692;
        Tue, 04 Aug 2026 23:57:08 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e2e1837sm548097b3a.13.2026.08.04.23.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:57:08 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Wed,  5 Aug 2026 14:57:03 +0800
Message-Id: <20260805065703.3230584-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026080515-emblaze-tweak-bb22@gregkh>
References: <2026080515-emblaze-tweak-bb22@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 05, 2026 at XX:XX, Greg KH wrote:
> Then you do not know if this fixes the problem or not :(

I get that. Quick question - is there a way to actually verify this
short of waiting for syzbot to get a reproducer? I was thinking
maybe fault injection or something, but not sure if that's the right
approach here.

Thanks,
Nguyen Quang Le Kien
