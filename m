Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626575;
	b=g9tNmnG79eAAazeqJovzoyDaVZ28ojn9MszSwiP4Wu5wwyyctJ7m0PWX2Ow1/apmKZpY
	 xOkQJ+t5Rbvg+SaLj34C3w59V3VEwNe2CWN8nvYO3FtDYJSJsdenhs9IGLywz36LBDvfI
	 UJo/5qJFDZJsD8mBPgkWW+9Ut2g4fH+iPg4EL8MImUwkC9q4Hdavqbnevaezdhn4+MG3L
	 4sNEIMf234/7105QXdVhmU08bGB6lhIbVuLU2hZUPOMiNmTPw5jKU9c19RuBavu9ehBUR
	 1+qSbIIIMbuwgdkNrZ+MJK69qZUgte1Ub/0vOiNN0/2eahb9RSKjZ4ma1+5L/s2ajgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FSAriEdpra/u7I/ME7mCm9im4b2dcRkdpx5h6M61veE=;
	b=M59nyLl45KQhHpB10zLyuLyZ1cu1kUW4ZS5j6FWAfOcTcll3S3GTb1jJjCWv7U7hgi2y
	 gGXo/iVQE6XReFsFn9MjHp22TN0x+BWu4y1jOYeKfdolybE747Pyw92wRsMHUBMtDKmj+
	 MMzhpXIRUqnAIKn6vlbfi9HyGtpPgzgfKIxicCdb3WWlJK/zwJK8uCSBIElzU9cA91Rxq
	 t0H32qTydZY4DaRtN6WCZ6YDalYnRbMByg7jjo1z0Q1DsgffkRXK7rKNc3hAuKZjrUW/1
	 xeZXOjl7G5Z499yvdmQw9xO38gExOhhrqy/IaSm/qAcy6637bb/+InCCBIMCEYuyOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U59eKdHM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6130606A331
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U59eKdHM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A231F000C4;
	Wed, 25 Nov 2026 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795626575;
	bh=FSAriEdpra/u7I/ME7mCm9im4b2dcRkdpx5h6M61veE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U59eKdHMPeyxu5zLbFJ19Ro4LXcgEAf0JugaEoxXM8Y+V9YyTlJW8lGxZVA3a+W8V
	 sYhvaj1TvMuG3k8EDLY2+JOQZxZj9qHl1Pkakd+R4OKz3VnlevhBNCt3LS/LN5YAOg
	 QdBP8oVADZrgDhOjz/SA48eV+6NLCMdZJvZkIhla+aMx9ugI3I2CoN2+xsBDFJElo8
	 hx5EE2lB0gGf/rRcuNvLZmiW8XCPUZeU6wMjJd70IYtqIwimHDu56LLtrWlx4OvUP4
	 ccXhkXtH45g9wdQzkWKXhdu5UM6YI5bjd3WvHzdD621BPEYqTfh2u0gnuGjXRd+zOP
	 W/w0EPtbGdPHA==
Message-ID: <sashiko-outbox-233811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 00/11] usb: dwc2: fix low power issues found on
 stm32mp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
References: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:09:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 11-patch series:

- Patches 2, 5-8, 10, and 11: no issues found.
- Patch 1 ("usb: dwc2: fix recovery after PM domain off"): 2 potential
  issues (2 High)
- Patch 3 ("usb: dwc2: drop stale state after register restore o..."): 1
  potential issue (1 Medium)
- Patch 4 ("usb: dwc2: clean up old role on mode change during s..."): 1
  potential issue (1 Medium)
- Patch 9 ("usb: dwc2: restore peripheral mode on low-level enable"): 1
  potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 1, 3, 4,
and 9.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-dwc2-low-p=
ower-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com
