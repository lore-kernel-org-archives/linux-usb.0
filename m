Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9E29C33F
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786205271; cv=none; b=XWiKeV+M1h4s/PyvAGEY54cPpgYMwNsLemSkPPMuTgrheqs5nsiqXX9Ynn3kTAbMILOTkEqy5QfNKaBX0FKGZgCKTSaigf3w29uomM28EzX4XLpobYhh8G5G6tyBBN/AxNNaw6RUAY0ZFEl0F9tQFu4UnRg1kZq6yf7SJjUqwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786205271; c=relaxed/simple;
	bh=xHY+S+KV7aofm8Qyz6ICcsPYKjrEprOF1DxCXtRvUwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxGCSet7BdesuSO4+u1YNb+XyNGgFtthJqPC+bS+4djlgv0GNdM6H86SLOc5I6FW5FWdq8yugM/SgBDFSKXwaZrhKW+prIEl0Icseq4q8rPL/9+oIuGNJUF2Hgd9oaEHB3kpeC5i2SCrUTAjFdgSGmi3pcLTmE+PEVOQf4kwFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ko2rpens; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ko2rpens"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2048775a12.0
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 09:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786205270; x=1786810070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SENg9pRRUoZlSlJ+dKSUdZMKiB8mTHxjF4bNd6z+scs=;
        b=ko2rpenscD/J2gEGs14EKE+UbBicRv/c9QYOfTitVWagMR9VdydBD1NL4XEAWsuydo
         6KlUYWZCJQtNjXHmVjadWoI6LtWMfXgzT/ugcEqGH6jEk5SVEIHIiTACd5bDNtBWVdkx
         C3bo4bauLeHYfSnoq34m5SZmQM9VY8n7dZu3E+MuOHHmH2FhMVQWvy6nDGEAHLZjxMVV
         iIvxR/KOk3V8rVcGMYlN3jMx0SbnurMf7/Hx7bFuGYqu/asjBI7PGiDufOT1ne+7FgrS
         qBF/SoQegecMZYoDeaQD+qq3TYobJzKQNucagHcReN26LMcFwtuUlxfSThRQGVFXyZj9
         ArCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786205270; x=1786810070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SENg9pRRUoZlSlJ+dKSUdZMKiB8mTHxjF4bNd6z+scs=;
        b=mUlpXHLh0RAmc7w36pDuasvVevrowsgn/JSxaTbHFssgA0YXp4ughb5ylD3JN4Nx0o
         EljvUMlkY4hlMxwiERb7QkgG5DwDlMzKtzSNeYGVtHpljwszxX+rNZkgYN8aoQRmnhX+
         nPrDGm7fsuZQ5wbzPLrYg08g0NPiwPh80PnCyUUXiAA458+hlRFshaFvWoyQmlM8cpt3
         fixETzxKEtUMSIuCvUPVPsNJ4k+GGfw1xCMb4G12QICG4Qg+pSfZLR99tTbXTHD3WUKw
         HlPhEzhOzqqVLYgWan3nqL8WpeaNZzO40a3ZlgOfKI3/tMlKafq0Zl/t7GcbkOSdUuXe
         PneQ==
X-Forwarded-Encrypted: i=1; AHgh+RokDz54oGNS9cyXKnWccJEB/GvNY34gzGYPNGMPK2YIJiwnXbocMnxekIMWvXpSxl+FcT4nlReR9NE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9rNZJ7nMznIgreHphQ0gUnMG84ljHvtkCIa2U0Phvgnwaoa0v
	REOw/Yarw2XfyhNM16dIDdN1RGibXIq2YeK/N5tXNsMdyqCFpSiidOke
X-Gm-Gg: AR+sD12r6ygx3H3KLorazHn8fkweOtLzbwA9wmRPK1vcmkvJhdA14rTJjyLsKeAgLCA
	AVeRVlM4UqjMsOJcNP1za3LsJpC3ZDMXT4AyY5F/Dd6icRNPT+fajdiVWjFvMiLQDfrJhWGGcKC
	lV6XWcjZiznCFGpRQj3tndrEnYqkR6Za14Jickf74nhgu0aaxdYTLij4n4PuraAqlZvz7GwXXHb
	yuQhErE06rW6exWWnqPpymFmSdIucCL68DZ115peRDipzPLt2+ejAsODm7wzWKJT/FKhLDgOQKc
	6jZRT9T+Mcin5HWhaH6OFfzhDF8z8C62FwwOncKtUSLB1qnkjS2ghPacp4QP++2fp7n4T5A+VxA
	rEtDKOivAb31d+DNtRiSRr9A6XQ3R1y5H8EnT0YxYU1x9clA/r5vUyA+oArKeZQhOKM+WHOrqBC
	RW58G4OBbuNufqU9PS7nmAT1owb37GCqdWPXY3wPyS1N4u37LRr24bQVyGCfFj/i3X9A==
X-Received: by 2002:a05:6a20:7487:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3cbd37eeb43mr5799416637.1.1786205269492;
        Sat, 08 Aug 2026 09:07:49 -0700 (PDT)
Received: from Default ([2409:40f4:1004:7586:314d:e5f1:6904:c18e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb877b4sm24529384eec.19.2026.08.08.09.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 09:07:48 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: [PATCH v2] usbip: usbip_host: fix null pointer dereference in
Date: Sat,  8 Aug 2026 21:37:31 +0530
Message-ID: <20260808160731.8698-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026080737-drank-trodden-16e4@gregkh>
References: <2026080737-drank-trodden-16e4@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 07, 2026 at 03:09:56PM +0200, Greg KH wrote:
>If you do not hold a lock when testing and doing something based on a
>field, it will race and is broken.
>
>Again, step back and try to determine what you are trying to fix here,
>and how that can be done in a race-free way.  If you don't know, that's
>fine too, I sure don't!  :)

I read the whole driver, and udev does not seem to be nulled anywhere
except in stub_probe(), where it is only assigned. So, we can safely
check for null udev alone. The driver itself seems to hold itself
together as currently I don't see a potential race. probe() also 
cannot run as we set our status to STUB_BUSID_OTHER under lock so 
probe would ignore that too. Am I missing something else here that
could create a potential race? Please advise.

Thanks,
Jeffin.
