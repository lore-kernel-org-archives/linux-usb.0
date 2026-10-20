Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509074;
	b=aFw3YD+YY4vLVETyUj9q/03LnXFKHNVIKhSN+w0f6UcoYoHtPRfoPZwH5+LFhdT36FrX
	 7cM54JTmtq2q53Pq7Lt+CjDskddsfSeQq5/iGMvIutzSk/5CKex5CpiCuzEfMObr7QyUR
	 aL78PG3EJMwsSlVxap6R8d6R54cARQ9I5JHv1rIBfqGhal6AlCG6kPAg/+Ha4ZdkIgO7P
	 IZHSUnXK+kQAV8XIrGjusu3Ou/WMBvfgLqPFbpof6eTkrkX6JQMK77d86wIezBAuxLJ/G
	 bUqUG6BHr8/ovUMnnCRXQU/dzFrjp4sQLWG46QLcSxbdURDNxxsFLcJmEaRPH+qoqHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509074;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5Utr0EAHfRasAyqp/UU+pG9OUfNh0b4N+FPUM3sRaOQ=;
	b=kdH5qfOpfVPWDZAVGrCCG2eQMIbeU6binTyVWeFsmcVa/iiO/zaIYbCvleD4BJQJct/7
	 zKUEfklnkmG8MUniFgASxgJhaRORIrgzkHP4ik5dWfwhCUy8bWz5qtWF8Y2wfkLI4PJqx
	 43E3ZYbgV4Ri6b6IomtItT2hUS4O035WGrbb3Iy4FjEbD+CgLByAUr4YVQcWeK9whT+oI
	 vmZhzn4pMcRR6qJI0rU2zpCkMTbsIInDMAAda/hQH2N3pYi6Yky3ieQM/q8mI1ExXqCay
	 R9uIG0woDO5ZMw9n/HTdZOEqldxk1s7pSv5AeaHVv5TBeDHAjzwoNRaSSVMOJtCm/jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1748606A31D
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9D91F000C6;
	Tue, 20 Oct 2026 15:11:13 +0000 (UTC)
Message-ID: <sashiko-outbox-179227@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
References: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 15:10:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A PCI HCD can be surprise-removed after suspend_common() disables it
> and before resume_common() re-enables it. Avoid a second call to
> pci_disable_device() in the remove path when no enable reference
> remains.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-topic-hub_=
pci-v1-1-bccdaef0344f@oss.qualcomm.com?part=3D1

