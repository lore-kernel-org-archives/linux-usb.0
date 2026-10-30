Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347088;
	b=4ogzjgFKBul3kyeVnTrLu8aQY/vEFCxq4d4BsD9h6+aHGP0XGjxScvDMGS/J0MdQUc0P
	 HzjVJlqUjMKB6X1hzvF47xLg8Ov2Uh4m0oitGIwEwf+QbQltzMg9LdxMYq2qfyRyQczX8
	 0wpGY34AhWg5sm2S1SzzBWx01dvqQzAAgnKNRafMbCc1YqiN2hNjGDrKWflvnyltlcm6S
	 Q4ylYr6sPI0TaKJFM8KhGiPiQtz36Rfs8uSBxENb5Pbb7+QRKnZ1+ZrIGrfpWCiZscMdC
	 yyMCe3Bfv9yrQSBCs1nk7F/iO0jFDB5xItH1hWIqm91Un0k+MS75Wf/8Ft4sYlztMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
	b=smTo5BUkXQxjtE8EcPEqqPft6SN6K/l+NJpSiL8tdWNLSn4M4eq00D5iEe4aiVc6JaMW
	 Ua8g3FjL6LQ/RL/wPqiH77cibX7eTh8EstL8pIyulSE/oCZ/t+DUJLU8PCmkrHF7uEVnk
	 ShzHxQKG/YgA5/N5YyJtBqPhzuz0JL6iaoMDIL9NMjgtTbVatlPnR/Cgy+44rKus3MOtY
	 2DN7//uooIRi51UVtwRd00Vv3CKMPzLYJ2jhvhQhG213TxJzwwv0B9jpnxuQ3XP/WOGcj
	 FlYTa5jLhz5c8ARAoWzbK7DUyU6J4+PCJQD2bib+SUGheecEsrDjdvuQkxDol7W72HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XFE8VPb6;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98C2606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 07:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XFE8VPb6
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso1298995e9.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793347086; x=1793951886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
        b=XFE8VPb6m1GPfBx2CUgfiC5nJbXLI/Nv8RbA4+Ji34UonIDhtgJhIHSc75StLMcva9
         KOWVbUN5h+ZaflzQySQO6eC5cwkxqqI8zuCDcFe21kSNODnzkzrXYalCsimjIRCEiP8N
         +Kt0MDJ6+REjoou+T/CgBTbRGvgfrMtu2lEZbe9L8p0TkrjmYDQivqPSAsiTr55xygK4
         8qY9VU+KadIp8YSwur7BL2MF0b+kcony3MVrFZmgkddU9eJyCzEaWjNMN+oqRx9LOBeA
         5NHmsY8ReCQ0lqHVfQYG6HR7Odxo+A99SP48IVFY96FkA+y2ENhxGwCKLI9mfrDOia7a
         SDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347086; x=1793951886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
        b=QL/wYAtl+bSMiqkbvEHsYGkzG/TQeok7dESyj42TxgOUGNz61IhTrisPUvgQ/EjqTR
         S8SgF+Qe4uz3GN76GsdyDQWLct6amCQrRKG9P6KVrx8L16rI7GHzkIFYqQX3mKOUvnbo
         tXbvNouAlC23xu/+ez/4uSzM3POpkrPahpXfkB9sym2M5Q2NEpQ/yZfH+A6eLHwJAfJh
         6XKugQ9o9Xf7Tu52FO+UDZijkehr8ZDQVH5Gbzpj+E0iKiLArTZdWoCGh1lL7DeZxo4b
         mcSGmHzBIeKj0DdnvDNZWZJ1mFKaAT3IvHza2yi7xz3FJWvzlJhgyfYl+DvN+ZJvu7Xl
         3DFg==
X-Forwarded-Encrypted: i=1; AKwUvBwIY9shCDBuXqLX8QlZr/fNVlKRpLbQcHEhzyjftzV45bh1Gz0LNaGZbuFXtYKKWWr0Q5SFaNXqCgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv/N5hLoNMEB2brDzjN0PXgXrrxATLdKwpQCC5iE5rsquSyBLn
	I28ecr3oP4cqM/hVw6sN8BE9QAbk9G9fJ/WbzENmPHv1Orjv4yEGS8hQPggHO260Tw==
X-Gm-Gg: AYBFou1ypsI17xdiuJGlJ5UFdh3bpL4twwSKIwJF5HAzykVMxvGgJC9wLLNw5FCjUVj
	Lz2SpFzV/Bt/t+1rNYioPUAaYJm96Z7LDuSTJGPFjvsT8x4Q0/SDioj/J59kVD6H1P/zcEH6SYL
	RRDKq1uKqF4Ww0qSI9Pg72jSzTV6ePYXUF/RrJFCxpnQ3U5kPaMxKfHr0BDA4W/6u6mxF8OSCyl
	4HEeVgBeBL7YrT60JcPfPO5D08tTLCzTLxcgBZt8SeDJh8zKUcpkIwt+zMWTSd41Bp6RKfxQf5T
	VjARXAydXYHHV5G3bVaDv5uw/cmNdAeajkCNguJG8H2gb09Fmb9pgCFsfQmg36Zm1F3ClTUTfgd
	CewMuIQFwRO4LCuL0MNtnMu+3wrfNrwv2Tqf+ni2lzyqJu+4S/5Zsczdtu5mpus5DQz3giKBzTo
	craTgMM5rDPxGgOjSc6etYBNsE3Goq+whsMXqmen4cKpv0Vcr5QJ9ug6yJtyzLPKe/wqKkbYIeC
	S7ukGAQZAOPe7NitOGD1TVZVNHNT4f5hr7g0Y1nGlD6+EqpYsGyLunE0CP5ohLOCu5Mjn5YFUjH
	KMRCyHHjLiD+YFuTGZehLa/WtKCxCgH0iD/HkVgHDaLW6eL45pXYCInCIF6C6uUSe8lfZy2hTs7
	f
X-Received: by 2002:a05:600c:638f:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ac150b304cmr29519325e9.4.1793347086099;
        Fri, 30 Oct 2026 00:58:06 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm40818935e9.5.2026.10.30.00.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:58:05 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Shuai Liu <847807867@qq.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	colinbrauncl@gmail.com
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Fri, 30 Oct 2026 07:57:58 +0000
Message-ID: <20261030075758.356879-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <tencent_A0D3062EB058E244877B87B4324B8DFC4406@qq.com>
References: 
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

Hi Shuai,

Thank you for reading it properly, both of those are real

On Fri, 30 Oct 2026, Shuai Liu wrote:
> set_alternate_setting() invalidates Endpoint<K> without the type
> system noticing

Right.  Binding the proof to the setting would mean threading a
generation through every Endpoint and checking it at transfer time, and
I haven't got a version of that I like yet, so v4 documents it: both
Endpoint and set_alternate_setting() now say that every Endpoint obtained
earlier must be looked up again after a switch.  If you have a shape for
the Altsetting token in mind I'd like to see it

> set_alternate_setting() with transfers in flight is undefined

v4 refuses it.  The window already knows about every queue URB registered
against it, so set_alternate_setting() returns EBUSY while any queue is
alive, and the doc says to drop the queues and build them again on the new
setting.  That puts the cancellation in the queue's Drop, which is where
you suggested

The one in-tree caller selects setting 0 once at bring-up, before any
queue exists, so it isn't affected

Mike
