Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530315;
	b=o4NyTpX/BLktCbWcVYWwnl7WBYEnNIIdUt2FQMHzZ7LGfxX5A1kuXm8MO0A3uET4/dA4
	 zrbz3F+r41IveSJkIlRdVSC1XreHlVhoK+waMK6k/xfZJ91J28QUfn3zpdzV5HazMqIJu
	 Pqv93dhJ9k08ZP/MgVFjM8IM9Kb/v2EI9+KYTFWWLJRwQEE1gArEKLZeNyyrqalbBEzWs
	 QUh7nbs1PzoCWXm7msiaNdkw1PwFr7Gy25w9pg2hsCGhErYLwudrF8TRIIzi6ECIhVQ1U
	 QVdGMBo6S8iCLGeOeoyOhzcPF5gNbnWxvXmXmOwx/+vgbWZQc4yEJWbxLAV2fXVAHew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
	b=qksZRjmTn75vsghKBZkF7xXStM6WS1qPQh+5HWdYZMpvHCM9kJIgN6AeaN5sSrDo2geu
	 vogpLTJ8pl5r+9PQcK8nAnflevLxg/af42xq/z6135rWXo/ba4m+rOEkIVuvm1amRGCEf
	 tKW4wrYwrTDIcVfdh8+RBbb6fPcQz/ooF+w2tTZP4h/XhJLEgyxhLnOFhoRy3lqXp3nRY
	 iO12m6rGKIFabhC0xp7U12o8cqjQP0MgYzYOiVeIQjpAdQSms1Q7DtXkHrX943Xidaz/Z
	 izlS0GhndMMBxQqmFmLnlDB/XkgyaU9+W+YHCUu8qGGokTnA2MqI3GLg5HvSem2sZyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgWOPRXR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943FE606B7FB
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 00:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943FE606B7FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgWOPRXR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so4981605e9.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530313; x=1795135113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
        b=wgWOPRXRMyrmHVF687KRGRjwDUGJboXACnWYKQha5FGu5ECX1vwJ4f0QpZbzBmlXHm
         d1vEBBnpBM3cVNmZVlb+lW87A1Cp2mT88WZGMXG+8dQaSLEoyoffbA8jvrk8aCw1eyvh
         CC6aHXXRH7nJbrWZRgLarBTChUXy5lEpZsJ9ELLzgZ/R7LLydbOlSkFdGpjOUIg+v2pW
         KGtOQWYDDwxZFzRB+cdXmKAyJH/g4VRYH5dtny5PIUOa/ZYBp+bCHKsVh30qrhyYCNya
         eA/HltK9Rfm/5/iG7Kw1Q4tOSniy+j3GZp91ZoECpVhLgrdjQxgptGzD5gzLLdlEzRle
         wArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530313; x=1795135113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
        b=Q1wkpjnouohoa/NVuts/AIr3hoNm8ZSaNY5sSgesyRD8Qq6cFJgvAPWjJE9T1D/mfx
         2yq7Z5fiTIOx0TlFGkqaVrf8DUir6Z5lscEf+6eBN9tJ2SAQniympUgrWOksG6k1j96H
         vkBfSNb3Tx5PKv12UuTVZPuM3ARi9fwBZxy06XZIbKN7IVINrIyMSFRoLqSl7ilQuywt
         QsjjrI0+aOIEXSnA4T9ECK/aJN5EmCJs92pK2vZR1zf01mXDajcSAMkT18ZGSi9gMZDj
         VixUaNQLQ7a8f6T9yzm8HcOAN3n32sgtLtG7tMc2Ag8m8IyduNlQn8wXozkAutMc1ZTq
         8PRw==
X-Forwarded-Encrypted: i=1; AL+hErHwBf1NpqLE+F7+2y+/6eS1Efo6nScjQbi/ItD/zkUbjpMsRx8QRe29G2uiNfwtahB65Y1cfWMcFug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AdG9dJHfYRxCtVT/X43rfG/qnFyz7QLDAM/fvfXRn82HrMhjW
	qILjulMh3nDCr+IZzUsv8HOqEbq+VjlopguVKojtpRWZNy6ch1gs19dE
X-Gm-Gg: AYBFou2nBIDEYUKJ9haRWGMA3sqtx2bqhlbj460faqamsthMABw+wJu1j6JUHoXPMdl
	GptUKGKlu5N2r0AIPLbhP1JZuM6FaRNwK5DC7gA5+YEg+NPlYNVF9HBU4x6Tg7NSYtMtE6bTSvA
	NKGNVNC8Is+kDsXtn0yQk0XydlwntcPy1O1Q9eQBHO4gIpKFinYL5LdCwjMPiu9S1wSykhnBWZd
	3N4Xlvffw4B9TQdl7NT2lM2iwAXnhwg93EGE09M+taYhdY65G7JmxLiS1QSlAInvNwQsUgFKYzR
	joYg0iWYTQwznMSIjO1VvlEmoujYxvwFrIswGT2yU3xyiMT9AVx8ZhbI+kVbRrzPhtEmLoGeMyQ
	Gp9v2y+L7iMETCuA+gUjUJ2mWMNCIYokrOYvDSyVf9YphauHo7uKXy6Q0l/ZoEc9k8yoNJEvt7U
	UU361AMifZNjMAOfcAoTt9zD5nBEy5KNUxZv6M3yi4Mvd+cB/BeV+ahliAUDzFreAVTgeUmQrBk
	G2jpGSBdT7oSnBphVLduJrLCp0bMTH5Qdojz4tR/7DJ+NnjS9PnE13y65FufQYBrR5sP/ibYN03
	lnHF7aBIOyLKJtFJXkvP5zmYYHF/0nsmcGzCuJwZPkdv68cE2qWBS68cAYTE4c3CIBOcUcvWpnk
	D8Z4Kq1pmS3naCw6+IdoAKLhOX69ctZqTABc5MxKXTD6HOgD55lSqYd/8H0Z2CTpPLnftskp1cS
	CXUTz7WTe12mqZeYx5
X-Received: by 2002:a05:600d:82e8:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4bb55a4496fmr16979925e9.9.1794530313034;
        Thu, 12 Nov 2026 16:38:33 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm20185505e9.15.2026.11.12.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:32 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Fri, 13 Nov 2026 00:38:31 +0000
Message-ID: <20261113003831.3671192-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <aup_2nJhE243HVAN@vbox>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-23-ghahramani.navid@gmail.com> <aup_2nJhE243HVAN@vbox>
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

Hi Thinh,

Thinh Nguyen wrote:
> This driver now supports many different platforms, not just SpacemiT and
> ZTE. If you change the description here, please keep it generic.
> Otherwise, drop this.

Thanks, I will drop the Kconfig change. The USB patches will come later
as their own series, after the base support for this SoC is merged.

Best regards,
Navid
