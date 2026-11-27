Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757891;
	b=UcdDEi0Ro2lzYgPwjESyXg8rCncJGkKfMfHRLzmYinLEOPqYGQic19vEm7kVrpemQziR
	 NCi2u2wdKtHotPflUNoCDgRcjc7jWH2U1kKXeXnrXkBuAr3zxum6hvYHnFRx+sHCEywzq
	 te4dAWo9OeDz/Ddbfjsc/BKDQXAWJKTlBvumVB/0gzITMVNuJgh8bQWnNH+b0OU7YYFi5
	 qDH+4khsBcHUmjqKf6JKTgS8sY9nxj7p8XT23NMZbdRDJ9EO4SiQ5MScqDIpOapd6ytPp
	 jBuV5A2fU0pfCj4gyqtwxDLI8Hb189ybAXkU2/R3tAdPjZcpVd+xOHqIi3dlXnYiJmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757891;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KRFfO25eBcR+ZkQz5uMvZJNdxGzU734oEDs4gbmok6Q=;
	b=zuTcjDeKElzvhzjuFQm3DlWdThfXAYbYZzHFDVrt1Nz0i4iTSCWtkS8n+kjhvqRFxI0I
	 yFtxTVxp6K/nDEdsKeVcqZt1+dYzuYrR7yi+iF5SKlDIVrS3ToyHIx5MB6H64Olejwo2U
	 mKBzHB+kkhRS7+fj1rQ8Q+9+y/dKTIeQJwPZf8vhgn6C49HcnWxZUxbuBYwPg2bbLXYNv
	 I5pwo1QJH3njmF5SYcAX4Hngs90l1fX9NK7FDK6rn625zFYhrY5ajbeKKXlTZJrE3o+n1
	 mNdrELjChN+Gg8ZJNNneMwtASoATH57wrpurYuV/vYtylTaKUYg8vpkXeqnGTpyTQUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFp9uuXs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B60606A337
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFp9uuXs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5972B1F0089A;
	Fri, 27 Nov 2026 05:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795757890;
	bh=KRFfO25eBcR+ZkQz5uMvZJNdxGzU734oEDs4gbmok6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LFp9uuXscH0Sk7wN53nSHSKBAAd3MjUUDHK8SU3mcV8k10fHnWZfbqEuTEkES7JPF
	 m+fE4LrgU08x2hnx+4yMgptXKj+QHk1HXe3TuI6kU9J/tOWl05IVkCBHZM51RioX4M
	 T6HlOoF8MC0wtbXp73yMcg2a0TZj8e6cYU4S1lALosketo2r7wtEXpgZXiUwNk19OT
	 tBSM61jHxQm7/rsnIw/rBgWyfmEEGrRfBxPHFpdkQXnDanHDHqdkVtt/Mxl/WaAv34
	 iVa5jJoFTO2ah4pmjHozWj6v+PNgJ0tUXIHDpPrSv8DMIhwU2o18e5YDQpJWkpRHio
	 fezUiqKVmZYmg==
Message-ID: <sashiko-outbox-236654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] Enable DisplayPort over USB Type-C on Qualcomm
 Eliza EVK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 05:38:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-eliza_evk_=
display-v2-0-e4223634aa2c@oss.qualcomm.com
