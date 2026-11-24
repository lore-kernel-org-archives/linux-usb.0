Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486970;
	b=Gq85VxCAHYW60JinV0+5oWLaaH4DQnjIyHrRGQuN8C+0S+5cqvSyklq6CM6yjx9FLtf0
	 UKbnTJPPQ0qns7x1AOCnnP2hzZBhwfF0+pdMdxtHs5cyO8MBBD0cQBUA6lqF/tb/Wuqi9
	 JvteYW2J5PwYv0YLS9Wz8fZ6YN61nt32Lqvgi/EonsAO2Iu6erBfC2QCTHjmbLYE83dx9
	 M52nemg8RbjBC1gn+OidupmhDyvcMUanbHVHiut4cMhbAbGNsWDPRFA4RFfQ8JAtK4p/6
	 bjvq76V6hOfIkCzL2XkhdfaXAb+ZJftttd5vyTDoqxTx1qcoJiHqjLjt3160tpOYRRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
	b=MDPWitFXlVjyrD0+/5zLzoy4Vx1qmUa69pFjR8T6vufay/sHhSTIqMx6tPJPR8Om9Zju
	 Ix+6xf2yegz6YBVaIEp8V2tVu5wq20oJlII60sozw2s3hmp8ugMPxCK6Y006Hzc/QUYaH
	 UxtCvAE9up8ABzVqEEJpQfworXR++NpIawaC9kTWY/ETc2BDGHV1R3ZL81R2rtMNYm+Jb
	 YYb3CHeVM68lsKOf3uWJMLoW2u3gMPN0OHM7zBUN+X9I5B7cvK1uxMQrteAz2T1gItM4y
	 7GzV8IW1K46oFDqlSGKrHjg+rx0pDVsrkHPEJrPMiySnPxVeNA3RDNElTyw4wZgUXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxUXIRv3;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD6606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7AD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pxUXIRv3
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f041f88577so21678675ad.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486969; x=1796091769; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=pxUXIRv3cNSB2fqhDzEq++taJVOXNxAsvpFFq4Z3FNDeR5u30E+syPLebzg1eYZKLf
         YGgYq1IXu1w62prUSCJ9yS3sMns40V8A436JulB0ngMbk7ECtZfjPaqS/vTAJ1sE8S51
         sVrMvuqoDds7otX+oYwC6TJv923S32/I76VkOCJBgwbFe/L1yxQAcMY61cAmzBhRGo/U
         YZr9wQjKfOZ8b/L89E+4OMPvLd/igSbCy7sTLVtW6mP35fFVc1ocWwc/K0ljHipxMWYF
         74mZC4tK5qHo+jk+yhL2WqLBVAWy4aP3Ne2q2m9DU8bVoKabcH75oBlkAeKApk2cgDam
         UigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486969; x=1796091769;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=b3JJ91P4Nm88kwH0qa9wicrMX/4VogLJOiVyKdq8Nk1b0ghXambkuXwkWpwrcdFD17
         FTzOjbISMxnxC1bmHu/L4R1aGcwq5luoQAN/PuzecjLu0WW9lHwnde1HS6TpsDWcSNhS
         Zk+WOtY4F9MTKgmzYqzV35SJaMlSMB/HYhSfda9P6SjvEJMt7b/L0I4d+lJsCHoQSyVz
         /zCudLSweRzprURuBBMY+AAvJ1kozgrKiHHWHz+YsOlZ6oIPFHkHjbHc5UM/+NMsReG5
         Behz599yaRLtyil85kZKx1Hm0TUf9gI+zdHK+8713hDF0a/l9DeE7SomQUVy3OSMa9lv
         uByQ==
X-Forwarded-Encrypted: i=1; AL+hErEWETPp7CzVUbk+H3NNaUmByikdEjY9ZYmlr54hD1WQ/GBxers6r5f5KTFBvMOosfo2/cKQb0oq7hk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cZTbh+YKrBwmYs5MB6Jm/o2SwA95erZdxHVbNYxnztchVqAQC
	Kz0qpMZWTG+M9GXpXgVgauoZXClaRBIammjJSfcPLOd4f2rz92nh4s/P
X-Gm-Gg: AZFdTZd7KugVUDMV9t4u/8fz+qgsfbbk8pHYmVn5Ltou2XGYAyTW2e+xPAp4M9vv+De
	ZMPZbgnnG6P4W8Gzrk9rQDDW130PeQiQith1In9CM6+M8EWAi/030c3E2BFtxTg8Szlq8HS4DLE
	y+XUxEsikT9wpXGSgIUhM0MNDuWYZoSlfq9qKbV5i/cf7msLJs+Pl7AXZwm8Fe2cp2ydhRLTirh
	vcD2co5EJGjIKGtKQkuwwzbXshM6/Looh5DzuK4Bq0oWuHgG7nPkz62DTDHvXdXTr4sT7QKSVpb
	8x2+D8WjsOrwcGFwpk/sHDPU39Hj+o/LNAIfK7IroLqrcfynx0UKAVnEhffEo0FQX09ZNCPFlXr
	FrAlo1p7wBZHBimd+kYz5oBfPmapXuIDjJ3wTV3DepYqANGcy2y2t4Hd9XFBGbZofpzHcl1ZEvk
	atBrS9Yn60YGFLei51vc4o482MfTL+vGANvDkJD7ZlwgsBlvkD/tN1B8+Korsorlk28sTMGs9mr
	AigMNTJONXAptGocMd3Oi6v/1QIz6LavgX3hUJJaHKNzgYLnrSlIWLIzqAmu4/Mfx8iQPNh/pJg
	SrKvp+WygcFKaUHOutQkKWBQ1AZRNRZF/N7ikFvxhxvfflYa2lIOzkm6seUy2St8FWU8uCxv2w8
	AI90Un0z7Jo31pSYuK73ITTl6
X-Received: by 2002:a17:902:e845:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2f03f17d16fmr137924885ad.17.1795486968838;
        Mon, 23 Nov 2026 18:22:48 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm51794725ad.19.2026.11.23.18.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:22:47 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] thunderbolt: cancel the queued control requests on
 teardown
Date: Tue, 24 Nov 2026 10:22:42 +0800
Message-ID: <179548696261.1834925.3608072470968351391@gmail.com>
In-Reply-To: <20261123055240.GN229695@black.igk.intel.com>
References: <20261119075557.3399335-1-shunsheng1218@gmail.com>
 <20261119111907.3616041-1-shunsheng1218@gmail.com>
 <20261120042721.420468-1-shunsheng1218@gmail.com>
 <20261123055240.GN229695@black.igk.intel.com>
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
