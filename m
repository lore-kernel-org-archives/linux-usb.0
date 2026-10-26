Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016312;
	b=byEEBJ0kKfBuO2RvY7hOLBb6Uk1r1/Uic6pdb44koKJ7CjzblNLANdTeW5Teu6fFQrfx
	 OG+beIbyC/Iq9N/7jDHNTtn3biaNUfoei1vjQMn90tea2WB5nxEWVA6px0kIV51AJRCXd
	 xLHdm1tsBuNZ9dT+zvEcsNZNHbrqTcjCYCC9Thsq0o8p58fifdoInUFLaCJ5klcA3T8lI
	 r0r5UhGZL8G3B266tkWgQrNP7QawoRvjTsCF4bSAkfuX4aDGLIQee5kzlTLRCBmzO4dLF
	 a5Z+d/y1ZYewmcTkrKC9j5qtRB11jQq39w5gk2bxdI4OlEksZKj8RJj4ffFfHpiprXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	b=ZIB3tawJjiasbxlamNVWcJvpG6swSfUxU1Glzw7hFjwAqo1PKhkhNPdVw0WJl/u8R0Vl
	 YVBXiXd3xA2HVLsthIXkY1iOhqjiyTpZ9idJFBL+2SVLxQJNHr6jJxJRcBOKM9EKlTjz4
	 2sBT4hY7715ZUtubTUAjo6onqdtL/XSYnnnL8fkJj/w1YdHifZIOV/2xT/VHL+VFJKquA
	 pgbQzrjRJh0BWhJL/SGhHW2wTut1+VzvMUYNSYIZtnfdAaXttq/cnvIx20NZP9UxBmqd5
	 RhYWa5F3E92cRDx+DAqfKSAwNYhUwwmzXwBrhxcrTz24FrZgPQckQWKHD/RcujhNQLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pa1LxFo8;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A1606A33D
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1A1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pa1LxFo8
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso4070618a12.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016310; x=1793621110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=pa1LxFo8LLbeGCNxDQCA6yMPz8vUUidUSCsG8ouubhGD557BRVXPQx+BtmCYqwWNaa
         5mNaJOHrOryBT3Kz6KRBPllJhlM++cWnFbyQh31H2+8aE1ugsXfAN0Ie6gvp7T0lEF9y
         lyhTq402eES0sZuiOgaqR4QrDgZs225fl1LzE+a5t92fpqoryRPyjyZJTVb5EYH1HbTH
         P5B6H3jf9ERdt+oQ+3U7p/hgB7PU26BGOfsraAJ+fY8wleWeD8WowZEIIbJKoI2nwLQv
         k0RBvtotm6xgxiOvgnviQATpJrEMCVWUggu1k1qEdKkXY6YLSdCVZuKzObEoU+ek0JXM
         E30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016310; x=1793621110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=cIz1h/NfiQBzv+Of4JeRSj7Ad3x1ZXND67MZJge6ETdSBVcnrDTbdLfrfpn+Wg3Jk7
         UI9p/gnA97NZN/EHKKV1/fwlq7U8PVuGQZkpSnBF4262PvRjaEA8hNTXFk3VsdqGdiSV
         IKKrnKGgf0RcjaGKLHTbHVrbp+Nu3uZp0jQfzzYgs3fqBQBY8ZZZiWBywDecZbcWacdl
         wvVOfF0TvXCZw7OCWrHWI+n5QuR7LwGAD7xJEy12mOCywk6PorD4Sv0PZetFZBQtz5Jc
         xjfbm5lyRukks31OcGolH7dXUtSV29577YoZCFKmdSoHzLicVOq5eCsNEUliVUbaMahg
         wq/A==
X-Forwarded-Encrypted: i=1; AKwUvByuwo1YcX+1PlcpVLKY41pw3TURdAKHzVx46UypfBwaT6MTkaU8+3xTqsklXiy8jiW+M4kVgEOl6wQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYItkKL+rA9mSMlRvRgsINbu2A8FrWWwUN++kFM2ucNMOhGlxN5x
	XGj2xOXpO87RYu8hnla3NOJRAm6NkNR/gbtQe2oEQvPtFm+RAfEdIpiG
X-Gm-Gg: AYBFou1xb7XNWfwTFX+y4SdAX5GaAADmsKiGf3Rn4A5j0UBlmbG0FwhrAtGit3Ilfrk
	XuX9eUd1zylZrEf61fTpoESyglRS6dCRUAq2oXswHO9elOSPrlD1kd2Na4t78+algAqHXMlfVLP
	nCUs0hM8/+eGb5UjA4SQX18gd7UoM828hkusWjzGrOU/rO32fCPCxkDEsop8SH3f8+f2b1mvfxG
	809NzQGeVwRz6QE+Yzi51mC0gVftGgq2byIAWjgzphnHgSKFIzgbXAfTYZ75FoYWq77vk3lRY+Z
	nd2QpLOATCnE6vnjvrr7dW8eB5Pzj2/qx+sKtpfQszanjLo0wC+EQ+QxLyxnojefDYB7NwmjWor
	DRj9JEgpdA084JlOswnnWxmv/dr15BClntmzqI0w+On3KhjSBh1chPXqb9q7PqprzHqm/Zs9Oah
	xAiRtLcYfkrDSlfyBSYTvTrcghBZ5NJ4R4N1oce+HE7Cu8ise7IdudkzkaNb4qdKVq5oUuHC5KK
	sO+jOX6L4gAPoVqZjRFk5dc6Ja1Hf6J+Xya+AKj/qMc+370tCqwG/7TYz/bZ1mpODxPPw==
X-Received: by 2002:a05:6402:4026:b0:6b4:1037:2b87 with SMTP id 4fb4d7f45d1cf-6b44300b84fmr8163749a12.31.1793016309713;
        Mon, 26 Oct 2026 05:05:09 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971383sm3453137a12.21.2026.10.26.05.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:05:08 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH 1/2] usb: gadget: f_ncm: do not notify from ncm_set_alt()
Date: Mon, 26 Oct 2026 09:04:52 -0300
Message-ID: <20261026120452.37013-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023-ncm-ecm-lpm-v1-1-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com> <20261023-ncm-ecm-lpm-v1-1-d01e81fbf460@leica-geosystems.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
