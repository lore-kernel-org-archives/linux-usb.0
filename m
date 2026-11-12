Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442611;
	b=WAx/gllOXPZ4zynUAVZ80xTD/YYML3b2GP19bq+Zaru9+zEsT7YsUGViRr6kHjhVaoOW
	 pp9h7R9N+ue5qnFkmLZEI4rVgp3eNJwBTmn4WaAnzQ9ykxuJrBEu2bvTB3TkS5YiXBs+3
	 Gh8IexAsZSykNIiY1ZRmul/fYFawYmTk3Du0fw3QSD0nGlYTFwACdDRjsTcquZstCHVbM
	 tP917OBA5hnxJ7uwq/4Jw0azeSAHHJEbW7tjn1oSf0v8ps+gW3lPJ8nn+ZmZrba+AFAjw
	 nLxqu/4L2+M3layEuTZB+FNZZURPPCOowouyEJBa9quKt1cbeCebxWTDf8Kl/078PlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BFLYcLYyJpDgB8FwsuriCtQnWcNZlWPgX5/Y0ltka4Q=;
	b=3MzZmaR568U9QqjrK9GyvlzSGy/sPmx+nk3FaGvWMDPLTERQoZ9hDx2xYeDpL7FXgU4n
	 7oqZB1X0HDvRWoqw6fu5yuWtLDCfVrQu64iHz77kI7xE9vLicUyv9WQf+SsnfiPh27kgX
	 uRANA4H4GHKp9MYMURBtn7q6tW7EfT0wsCaZhVc4H1M1yjWB3d3FsB9tQNaYrYS/zrF6o
	 3u3sV8ksuvNTGA9zwp5JlQNYwXTcoSLp7UPmO5I/6l3yjNYMuOCraENlMPENVfIzKn2yu
	 A6mzknpyfJwh+WD914XbpqHSqnEztN/Oc3WqbTJ2KkXdYD6lQQcKA7U8VgM2m43ikcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxl9rao+;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9BD606A33E
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 00:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9BD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dxl9rao+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so7479272eec.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 16:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794442610; x=1795047410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFLYcLYyJpDgB8FwsuriCtQnWcNZlWPgX5/Y0ltka4Q=;
        b=dxl9rao+Mve2THh2SlKEiLWxcU8xmxDUVWW9ZzDnBNaloGcEPR2gnU+RF0iacvpgRy
         qBDkN6dDwY2DqaPsLjVKfgSwV1+C7D5SjdeLSsIuu7fMX7RYF1Rg8T1h3358ueumZfe5
         vCLZsLR4aGWsz4j/Bq7dtWoMpy682KSkmpf+H9HP8HzkLmF92GUZ2wgjkiLiuRaz7+RF
         lG5ajUD9brwDyJNcJ3B9VuHoYix0WvzCyaGHtTsjVGkBAb2b5OMeWju0nA7wzKc+Xt6D
         0W4l6AeaT72UfoNCyfaFOoZan2h3s4hsEjqA9oj5Kn16XbUH8v2CBdGxOlGGkMN3GZ05
         KdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442610; x=1795047410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFLYcLYyJpDgB8FwsuriCtQnWcNZlWPgX5/Y0ltka4Q=;
        b=ehowiKARVFNc4RberEtwFWPXCn6qDaQ+Sk5qIneiYqtolUIiadA9VRqhWmBwc4f3eu
         L42NK7odMRUuyFrEcXi317PkSDMQVwj5ruUJUi2HUYvX8+d7/OO9A6/x4AuPgZZUyEyp
         EbEoVIGAZWhbod867VCfmo4KmOZ5YUdBCdKa2eewYI0Y8PbfXtYbeACqqkEa0TAgJI3G
         b1HwIBtL/bciX0Z20d33PgQefaIW1IpbX9Xp/D58OWGXsNBqDa2K8Cy7tfO2gVgXOlxV
         oX06GLsaSrM/Rbu48bSM8QPRoThWbe3T3FJHdHXYo7cioLIF5waUj6puvqu+4eX98ylu
         gInQ==
X-Forwarded-Encrypted: i=1; AL+hErGBMyBhWuAD60S2dfZZ1aVzFjmsmPbshxqTV8VNISd2og281L17iSuvvqHfB9aFUeiw2jo1gnxLVlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/epSQN8FD5zhRpriaG6nDxCJxWVMjDU/WRmArnywo0xXUzMBx
	Z8GIzRpLq8J4B1whFrnUuUgh6NP/pZar5ZJ5ddHMdAwBcO7yOepHICuF
X-Gm-Gg: AYBFou2OZXKig2jnxFglaaen3InJSn5XMyD9xCFc0mSR6SlCI1t3GcncSZ9LFGF+tHx
	iNoIHdAQ+IxJa6YjId2dq3Xt+gQgY90QHzUEXhjJU8Nb+MITFMbDSq2X1QAa7tkv/dqjluvT23q
	pFdzSpc0r3/0BmI2ayHRtcccFunggNC+DtiON43xaHFP1Ew2z6KgqLTYO3/q71kT2kdPoDdqkZo
	k1BhXWN2bf4PsE4BNbZHevg6xo9oEVgJhicoLmVdRkG9kmpdcPPD76oo/Z0F+1xgLo4wnQlxRNH
	OWZKInKlOtFSUzWb9GGHdmMyMMI9GGmp//asoSsy7qqpRqdmxP3+69qT3LHM2rwUI2sip5GnmCE
	V3Lf9kVrIqznKONRPWCXzDB0XGmeV7kOqj5ET2G4m9yP5fXp0jApa8w6ABtSheG06UnzvQ8Ltve
	kLtIzzKE8SvG4uYs1QAI3bKLqCnDqk2qgtJIiBPne3RgIW9HLSgI9DaJFt9opv01nqUckz28DCr
	fD9DxJDVDhvEHbVpCvFCe0TnLbcP4UvrQYnwyeqlyYjlT+m5DhdB+w/8YThPTjgdeluNh4R6po6
	td2lJywcLQvHI2yddB5Z/DexWTgR1DX2V94X4nuP6e5EZtAsO+50slnxPamp/CljQgnisUR758M
	/K8VKbPeSfaJx4/UsMVadX5Y0Iqt1u+pTPLZkIw==
X-Received: by 2002:a05:7300:6a8f:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-376861732afmr3870927eec.28.1794442609584;
        Wed, 11 Nov 2026 16:16:49 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm40492697eec.16.2026.11.11.16.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:16:48 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Alfred E . Heggestad" <aeh@db.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Thomas Reitmayr <treitmayr@devbase.at>,
	Shaun Jackman <sjackman@gmail.com>,
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
	Florian Euchner <florian.euchner@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Xue Lei <Xue.Lei@windriver.com>,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc/configs: drop CONFIG_INPUT_CM109 from ppc6xx_defconfig
Date: Wed, 11 Nov 2026 16:16:41 -0800
Message-ID: <20261112001642.243554-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
References: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
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

The cm109 driver is obsolete and being removed. Drop its module
selection from ppc6xx_defconfig.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 29acc77573d6..4ba35b9377d7 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -537,7 +537,6 @@ CONFIG_INPUT_PCSPKR=m
 CONFIG_INPUT_ATI_REMOTE2=m
 CONFIG_INPUT_KEYSPAN_REMOTE=m
 CONFIG_INPUT_POWERMATE=m
-CONFIG_INPUT_CM109=m
 CONFIG_INPUT_UINPUT=m
 CONFIG_SERIO_RAW=m
 CONFIG_GAMEPORT_NS558=m
-- 
2.56.0.567.gdb80ae8cd5-goog

