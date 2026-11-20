Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157752;
	b=02GyTrKqzf1jbkgicVGBY+txBv4wcphe3asCjD9oDVOLAhtuMvFldVdcEqadPhMC/8md
	 9IBe18RwWu7UIc9ely0NTVDtave3xgomz4GwjPr6WKPjxQEhoB03FZyiV24S/BD6jQfYn
	 +AQ1855oGwtSd0Nw7cUffY7s5A7Bt7WSrCvJ4GWz/hOHFFun2+gDonzrEJ4eaOh9A8+1G
	 /SZoNkgcULqBQBx9kJcMVlSE+MUHvpyOnrDRWDQIqI1Bvnf6KTzINQWrN26QAwJiTtYAR
	 e+RwmaG/xcjc5uWetFkaouCdfHIYe2e6SElQ/oiHQ+JA2FnJzjQrC0/hjY+JJqzDFSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l8t2fkSnm8T1xxwId5w98hbT0i+iHQGrTGRNI87vf0c=;
	b=Ub2I5ipT5tNXFzjw5ocKjrB9wzho4yzv+qLz3aNAqrNSbfQ3HyaVZQuQnStI4NN3jVWF
	 TtLZ/AGaEcHU1FE4VgN5mWW7742ze8UF8ljtOPe+TuDwqAU3pmBDugW+w0ifKvpjEbIZ+
	 +8Q3v2rQUippuqMgsDfQMCro/I9TzWLY3jM0lWbuL4cVFHuyRIbfs55Kn8Up7LQ9xjwvd
	 Mo1/783IIzZVC8fI6WKEaQLccE4kTl1G+7KH1EVwyhUgJ1qWrgJv81a//BWsZtK3sSYQ5
	 gt+xStf7ldotvAz6wNln2TLLQ5pDDeJO+iiJhD7jm6GwwPoxWS7kajtq/ga2BOYdjXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gjnb5Yd+;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F983606A33F
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 06:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F983606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gjnb5Yd+
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f037bc348dso4839225ad.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 22:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795157750; x=1795762550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8t2fkSnm8T1xxwId5w98hbT0i+iHQGrTGRNI87vf0c=;
        b=gjnb5Yd+FBjAZMga19TBDl1JiyAgrAoHimT0AS+twnuAcCOxzEmUxjGCsjLnGZlw0A
         eLeh3qf87HlcggPcnMdG1TZXli+9b3EDScQLJ98yy5Zhr0fzmQ1GXoAvGQN4cmHs2Vpa
         buyR18OS/GRaLmevVpEG3nw9jzRqQ37ZXf7sCUqFKKEJFCPmh17qeZdIq6rFBspXo2ad
         j3qec7rQBoL3gCh+Lhy7K7pgHB06fLbpX5SZenrmVfRZ2S0qe2yluB9+C+G/8s5Smegt
         CH+nnIvC6n4uyfJFCbWV1z6EatzMdlh7+ynZNIQTQM4A3pJD3ftj1h/gIwo+XlRwg3/J
         iEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157750; x=1795762550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8t2fkSnm8T1xxwId5w98hbT0i+iHQGrTGRNI87vf0c=;
        b=1v6GPESngXDzmdPJD/8B/A1FitLLAMXyn7SwTGtlX1EYmrF2McVI8q6UHWEIXgCERJ
         7tVypazJUIwfU4xde0rs98mPYSAezda2jNEiD0FYQCSn/G5FXVnjS7wYeczlqa1/Zq2m
         nZRqgAH2Z59EmTlmycCluRYP0dibAuVrNAohxdAIiLBIrQvpF53tEnjSSAejYVVKpZmV
         0Kz/ju+cDBJCMHWnBQiVnUebEj5auCWQrLwTYBjQFmDniHr7+SRg6PEe6tQ2d2nAKzL8
         qfxSHdFskOHCGldv6kutG1NN+yjqkP4XuSEJxr95SaHzzqq/ZS/RPTYPnCPcikdXBj8B
         ETXA==
X-Forwarded-Encrypted: i=1; AL+hErFD9bORzwj7WoIyWGqpdXePJqDlgRaAWTWZz2k7OUk0DGg3gDoYNIn11kF/Ke37adFEgYXwzvsaTek=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AXbNN+vCiAKoRul2JWWKKZOV5iBztqn7gHW/14N80lsOlG0JM
	IxvnT3gR/jme9P2NK4hN8kA0saW9ZVM2VOAb9yO9obZWUmUHzrsiNDyD5eYCN9advpY=
X-Gm-Gg: AZFdTZeKtqnxvokusOTbPoEEcQAS3TGwSG3yAAphS9RX34/8MiI+PfkYmh809wS14Tn
	wknageEA9cvJH/t84rqTE1ej2TpGMSZ4gZkS6jFU+A8z37ZSw4ClkgSntyGBbYoiq/aH5qMaMWS
	zVuGYIxy7QsLYD5/QdHUs6EaJXcPyVS7gip39M3ipAUZhOkQrz8ErGWmdWYmhS3VbF2JR6lZRsh
	F5Qi6uca/RM4HD62tWiopd68wTg/C0fJcCtVUKm1lGI2Xa/Q5RMzGbeymB1NM4igAEP/EypkoIQ
	PiSSqe1C0ap/NNwaEkt4/HNZs9/3MXbJ2UT8HxKOb63AlQP/RVT6qjMNzvjL8nzhJGrMrhpEt6a
	A2WLBhSC7glK7Ah4imSzgXf0uw3SFMtfskwDVlPEmM8bB+4dEBUzEqe9hlxsPtqqJea2OI6/mwh
	p5zGIhuWrpF9wZrurkPKgKx+q88ytpdApiiwOJptdsW93/EX9r7up+NiRB+UOs76lnADmykqwod
	7F7OMq/xBoJLPqUj4mIpb+HqhIDgPU+4VN3LknMqxJVzhlz3qD8gDVMXLo0YzT68X/VeQYe2Qd+
	JW+sbi8fUrjTXn3lrnQU+kRuX+0HaGosDqhyV4R40oU8MNnFYNAASDgjLKGapMlbiZLXzuf6sOx
	Tsa+Qf4SF3GQUCg==
X-Received: by 2002:a17:902:ccc9:b0:2f0:4df4:8961 with SMTP id d9443c01a7336-2f04df48c84mr843405ad.14.1795157750474;
        Thu, 19 Nov 2026 22:55:50 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm9884785ad.75.2026.11.19.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:55:50 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Date: Fri, 20 Nov 2026 06:55:48 +0000
Message-ID: <20261120065548.940641-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <92980914-a5f3-43fb-8bf3-714674f1b1fb@suse.com>
References: <20261118145636.3534234-1-william@wkennington.com> <92980914-a5f3-43fb-8bf3-714674f1b1fb@suse.com>
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

On Thu, Nov 19, 2026 at 09:24:51AM +0100, Oliver Neukum wrote:
> Hi,
> 
> thank you for the patch. It raises a question, though.
> It is not clear to me when you use READ_ONCE/WRITE_ONCE
> and when you touch the disconnected flag directly.

I added READ_ONCE() around the unlocked acm->disconnected and then just
added the WRITE_ONCE() for consistency. I guess the rest doesn't use it
so let me just remove both of these.

Thanks,
William
