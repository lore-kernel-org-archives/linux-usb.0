Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174457;
	b=uX2IxKt3REyx9XdHv3qdMC38b0U49ZVuYVr8RJOZ0vGvudFQcj/VJpCepTbzuS7tYyag
	 X/nikD2MMIzVRzQDMJTrfoHFekw+ndHjdvzWQIrKpZFcq1rA7ge9lD9e3FBBxzOJEMA3N
	 8AMxSbvDDlYe0UemrII6ZOz0IdLvxO7KY6stZaH/JsufkIj/dcy6ZN+UjxOrDg+Di7Mpj
	 A1wnpHc8Mv/qDnu71tWf/pUy1fiwahzcwgEs1qJSeml0N1FRRCu6p7GZtc/aGKd9uWd7a
	 +uzgLtM3efOsnTV0NHOhDYOgMvkuj7MaG7XnRLsPyp4h1CGlFm0rUXvbeqTQJi5J/dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=WbVHiWjdH2U0B2VaZwHdpDhK4ox771dqhHByUERmsth73UuCR01WbLW6rB8JHR7Zx18a
	 qrUDFnCqTe6ZOepOrieg3eAGXGZUpt743HFfpjlHbxX9RCjj/OPld3QEAshTs8sKFTLIC
	 A/BWSD1mK9et+rJ0pt8gJ0Xxij5vjj8MBlLmgKN8Mi639JuYf93WoBiKbyaicE5xeQuI0
	 ign0Bk8AyuEHwqMHlp3yEdtHLmHZSLDXVxUCIR6OnxNampcL3W9nG39qPN+2e1kiZQjN/
	 BKPmbc0t/L/zfV1ZLKPo8ZKVIEirMpp39PEcpkv2a+mxeBLmAdQ+fbEyZxV7wqDEBbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DIc6sQdh;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85986606A32C
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85986606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DIc6sQdh
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b402824d07so575290a91.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174457; x=1795779257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=DIc6sQdhoZDPF1oyrHBgIwAwhZPAIRAL8eGHMpk5qP89FFgKp1tR6BkAnF+hMY9T4f
         PyNHTZJJwDtHG1ybaDoDrltuNhrHabjdkQTAoZYt6xnQ116XTSYSI7X2LVz0nGOmP5So
         CMHFJrk9kTVCkC9TPhtS+JeYksO+a4v8Ffu9PvL5UN0Y0hA7gtTp3qf5QH7NR3eWjnBF
         aOWW/RcQnIohHINE2XXl0RU9fpICmw9jme6+zHEDO0GM/17kck4pI4+8oNLF5qw0Upc8
         wvuKutXj13KzgOsn2B8HcBmWqXhqbsnF8CpvAc1eSycvPEMsucdFfkXcPCh19pte95N2
         rmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174457; x=1795779257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=QW/udTtFSBrJzWr+2drIxqtyOZcWCZtUIgr14RTfFUBLY3HACLbi5MZIBEw2buaqzu
         Aix+HmTS3dTAoiDQKAaKfD14c/ZpvjU3f7Vn+jZrBftG04hBk9H68+q0DFoBkxjfdkio
         svSWMQeslj9WNeCRx/E5ysYfsAar8Ha0aPCbFbaybsWzQLdRzoM9UdRXBq5mLPXUocyP
         tTJsm91POLY0ixijPHVKjDDbeVk787UOAY9cHuc/fvEuM1gIS12OFh6jzBawKY/EIWzR
         SpC0bOav/1ROPwbccDoh7r1aUG4fK833GOERdqtZ4I2dLG3TMVWSqQ4NSJGd/OvpiWgE
         d9Vw==
X-Gm-Message-State: APuU4Z82uYpqV1tQR1TVkJv/xp7fwLRk6tFAO/ytLiA2dIs2c7sd0++d
	PBQ8oOJwT2bBUsn73Uj4iOmLrJrwLic4R7VD/BL/mOxL3X7SNff70ML6xGwhZbpL7Wg=
X-Gm-Gg: AZFdTZd4i0PcciFMZlJfG/5bD6uW/4gZ+KBzxHFm6L7o0dCEFtF5c/VvkC9BwW13Iqp
	ag9KHkRr6uuu21nX/sro9VW9CHtw+TD/FyyAVS3JAEZ1qhlwPcsAzhJrqhJD9siBHhIaSzOHY/W
	ukZq2woIXi3PuG0xjOIcKKN56Ry2A0aSVf4bNYuO9dgeaKFxN7v5dZlZlMYZVCl4q7zAtAW05jP
	CHys7ep16ffkUe8UrYYcKhQrV0lZoyOZuWGZ/NBTvKErC3GKT+I4faPWZ5m/N8ofqNIW1d6DMvN
	ktwqp+eBspvMMdJ2efoG1SXDVUD8DtGCsMg1FCWdjCmFPK1+NlftRgffB/U19iGXmpIPfDZwpLI
	alqgUNa35NoeUF/BSaldixKCkUUJuYYP4tVt1wKPS9ays6kpDN6n+FycKTIx670haSNk4hQFmXl
	BaRxUFaODoddTZdtFkg60mSCuDiVBVd0s6uiHM3xsfp+zSisv5u7UnhNfzrTxkHPgwB2yaeOUoJ
	1adwiZWAk8HqxfnVVfynAE3nundpAA9/qK+ClAqSOObKgAbS0laSL+dZdAurmJbSZT5SLZFbZ0u
	TQlxF7DTZz7FSyuvGRUDkn6DIubrczAUUjqQRgEpfbBOWgERWKQLIx/6hqqF5CCP32B4pgts8O6
	e/2YkGlCC9xrMqEKiYprH9KQroydYqbLbt08X
X-Received: by 2002:a17:90b:3b84:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b41c97c897mr2571898a91.66.1795174456775;
        Fri, 20 Nov 2026 03:34:16 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22aaeesm1455309a91.3.2026.11.20.03.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:16 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:34:11 +0900
Message-ID: <20261120113411.3069169-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
References: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
