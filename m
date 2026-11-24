Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486986;
	b=R5MPYGmWyNmuKg4cg7DIdYNHyGteZsyGTkQ5ExKBybYQWKYH5nAT909l6kcH57tVr1Tf
	 dlRKT4p5NaNPT2Xpxi86O8HJNAktXLZVLlnaUNx1LYT1LFZ6eX3wSbxyeCxhwia/N8fsd
	 CNFcr9JFYlX0HVe1/LJAqDBjfkNIHSfY6lhVu+RRHz/5i2PevXo5NZuUQDlEVwFkfCIrz
	 kMdvLishJYsopifXTcxzDsaGGKisLGcJlmg9gCOpgeOvoeI9umITOR1XZ8v5XdvpaL3Ng
	 aX2ej++HxkixwrQ1MkiGa2W+CVtFaIuX1FsxurUrcgci3VXIcSZxXIWgLl7b501/L8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
	b=XJLNtbCCMC716k7Dk9ANa3XT2W4zzE9DLQ5EftYTzDmFUyE5sBTdTh0Q8ql5604X1687
	 FtVikfoXqAUQcHZSEXT9Lp60bg7ZXcRiHaC1HBRX/zeDUPPGgaDOFB+hECA55j8rwYSG7
	 eUQ5O5KdBElVRgYqrd76GYMr1dxqRX8VfzHtnHU7SxPR4u/CgI5m0RttpZwUQ3go5dVcL
	 iQydYkm87/3oSI8HN6PRG2NUpm0w1FcCesemWTl9kwt5+BZL0G4GpEDqi4tYOGHGc16tk
	 im8y1qibTq2sTUCarvIwhIOCZ5+cdvoM+XN72DwB2lZStB+LO4op8MERu/g9/Semm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEImYII+;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731C606A322
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0731C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEImYII+
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so1943858b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486985; x=1796091785; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=dEImYII+AfBPykE1rln6dfkL/AoigkBcD+0xCIDiMpHb0H8cNcjZkygfwDhgtjDfcJ
         9Fo/Od1n/r+bfOkmHI5VnGla2dpbCoMf21vdRipAzEwyw4z+bW6s2y1rpBcihJEm0H5I
         yL+cO/0mhUu1Zk5yczDwP1D0zZX0QVhOrUejPEVarYUtJorOiYsLISNW8bUdqVLiZJky
         4Q0fsvMtpnx8J+ZF0M1CrwQDO6ODKggsQ1LSFfZiKSjfgOxpXv5FBjUlsjrbVMlLMnax
         VJDTfHgIfvNp/d9GMakzf5ixPqr3Ym4Th/X+gzTtKbMYJhmCRSh0apOqXXrBefiGAVxq
         D5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486985; x=1796091785;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=r73ebUxRdSbBeEr5wGUw69nnaKKTOunxp67c4mpmUeViKFkMfQYYtZV9jdhwMwMbBt
         Yy/ts/JTciog0EwIqmmcpWOO0E8k2GuPWvxoThNKN0WRP/36lYf8DmaC3++1nvmeaypr
         9AEx2dcanbpfIX4axhymy8yYw+SHyjGhuUE+CD0ZlL4DCzAP3sm2FfNbAiZHj3fKp6E/
         +1xWygD/qrqgSPVHvkOelVCbc7jNWPtM7AAKo/Hmhhst0xHpK8iup+7je5acE9VxWz0Z
         WJSmD0p7JMFJpGsIw6RrKOOsw0QL1ISz76v4XRtabvGU921zrusEgxJOh31OJs2mgzir
         L+tQ==
X-Forwarded-Encrypted: i=1; AL+hErHdQk3ZGt7f7/NEH/Y7G6D3mY+5uU33Rkqd8AgtMWnItPAuzQM9LsSJQUQolRFS7fxlioIIMmvhmSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xifyc1BprseZ04XJ1PnJ+u/+NEF7EPC6LGEPnEGAKTRevsBK9
	JN+Xb4m335IqhUuhnw4QMDhcd2OFD9l46oqVYFReRj9MCM7Ob8KxNctz
X-Gm-Gg: AZFdTZd/X+6wCHppEI+HcfQI98G9nBZAgXdf8vTnMRaswVaHHMbkm6yBSARdi+U9Lz2
	5Fx+NMVaWuti4pUKQA0GkrDxUkfZQ95WdwD6YrX8r6DfSoHUrS5fF3eZhMyVYKD1zK0GHzD/j6h
	Jqf6OnCvwc6k0Mi5LnckXUJSlWFwJnRH9w5gPHOjHa3egD+L6/K6DM1aMYJ7C0mtRDeKh3hhyaI
	pgN8BM4uVmbZUEFKIhzJM9dTkNku5/9MK4x9Vg1LLUU9VfbIKuE9s2KQbhPBxH7laDmw1LEY+lg
	2Ov1sV01h8otsyZbLU9cwunNvrnRpP3iZicAQCrUJS29Ml5f+KGcglxlXFkBRoAyjHszPNHtXZt
	+s5/CgAPN5giAAwRU7R7WPAc13XG8d8Sg+JmvOlG5ij4MetnnVqdUg3r5T+upKYQ7WvZDlNNVez
	GKullUtvj0OxpJlh2GkLV8xW5ptGl7dWeHg5rbVdyPqGts9MElAkGtojzLegVys0N7P0jgHyu+v
	vHEYWeOiFg7dEu7IBiFS+ROk+iFKHGNrxf52N80lpxTzMcn7aDYobmPNbemDq5rllIUAGzxoHK7
	OfF/igSXZrA6+ej6SPfa2rUWv1UVsFOQ8fIfdoCe9Wi19x0fP2W8kXeB6j9TNGbdRPgtd+U8ciY
	i+56HmcQ3jXd17LiD0tFycJxa
X-Received: by 2002:a05:6a20:ef19:b0:3f8:500c:1de5 with SMTP id adf61e73a8af0-4014ed55fd8mr12187901637.66.1795486985241;
        Mon, 23 Nov 2026 18:23:05 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm6439892b3a.2.2026.11.23.18.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:23:04 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [RFC PATCH] thunderbolt: cancel pending DP bandwidth requests on teardown
Date: Tue, 24 Nov 2026 10:23:00 +0800
Message-ID: <179548698032.1835311.976395071942954809@gmail.com>
In-Reply-To: <20261123054525.GM229695@black.igk.intel.com>
References: <20261119023558.1495581-1-shunsheng1218@gmail.com>
 <20261123054525.GM229695@black.igk.intel.com>
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

Hi Mika,

Thanks for the feedback.

I don't have access to Thunderbolt or USB4 hardware at the moment, so I
cannot provide the hardware reproduction or the regression testing you
asked for.  I will put both RFCs on hold until I have that evidence.

I also take your points about keeping the fixes small and writing the
changelogs myself.

Thanks,
Yaohan
