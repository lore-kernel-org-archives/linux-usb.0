Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778752;
	b=vd2RyNy0vIB7VxdBY3P+vZQYfWyl7exSCUSFOBY3I1zBH2B3jlvZ9i8ZE5nNAbP5tfsf
	 7bGzTFEhpvlnfzKOC3i/+slgQaDUOXvP+ccxRllivbXBqPR61aoueOf8Z2w6QNG8aouz+
	 NfsflIVnupTNAMq0Dkqm/9myWBGf3Ib7Adbo3iJBzA1weS7qQJzSiN6V1zTg77eivYYMh
	 LkOHXw/ISAYhUb766gaPCcN0fNXBn8Lr6ij/9pElB7LOL4XsYkFsblQfesEzkn1pNQCT+
	 qXo5OnstEJcBylQp5N3mV7QK4rdmhcZNPeZLBBCcXCtbcrOOaBNOaPEhg3+ZWDuousw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778752;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sYIvR9E5Ghiu7QC/GP1r9kg0DS1xSFAA2Dq+/z6kzss=;
	b=m2XlxHSI9KSJp59y0vwwxX9b9PzZo43RGL5NizPZj4DUArxt3cwZpy+RB/+9QQUXF/ut
	 VjrZsNcF5qxFXvPQK0TESvDe5iB2mzVx+hyceF6p2IYEjedN8MnHv3tOwtK4LdaNkmfw+
	 y8QSOyFdz4QJsuRxub8HNL9zqC/vwoCyjH/4HhWQYegEDgk0tG5mn51GRgYUedNvIUc1P
	 7/sGZ7+O4BH0QffHr2kR9w/BKOGI9fcvWIuiyFYfWKlqynlghGcaTF0XIgLLTCrItFhAZ
	 i/ZUQBsGKggHNi2frESAvtyCA8AzarKhODufLRr2THKHbkvGPkxb2WZc+gOiT3Tfs2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfRNrb17;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD2A606A6BB
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfRNrb17
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968F51F00A26;
	Fri, 27 Nov 2026 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778752;
	bh=sYIvR9E5Ghiu7QC/GP1r9kg0DS1xSFAA2Dq+/z6kzss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FfRNrb17hGLqGjNr+rv7NtF7r6OfjwKAei+Y5h74wF3aT/YK1NDr2adEDMIzd7/qJ
	 gqZZsG7V31ZSIopVi/TnM11gKv6MxYKjOEZjFgrbeuN1utHHjpmtSoXR5sFVwD2wEC
	 r5Ir8w1LMUL//SpT3WGXFvOBZC7n2Wa/qVQ7I9M0kO1zwoX7VkC2MQzLN8Fh0YlBEc
	 AXLYKW6+w1jEg/L6ZKTJAQSks4xHKAMidwrLGwjutjvaGWLRpwr5iipb/Gv6jyzVZE
	 RCtFTHGXlhgZzGSgvPgZ1RnrBd1iNf5P0hV6OrwsAyHwaPf4fVlEGg2fgqJsVcZP0W
	 CKF7RksZyI06Q==
Message-ID: <sashiko-outbox-237238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/6] usb: typec: fusb302: Make full PD 3.0 work on
 the 2.0-only FUSB302
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:25:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 6-patch series:

- Patches 1 and 4: no issues found.
- Patch 2 ("usb: typec: fusb302: Drain the RX FIFO on each PD in..."): 1
  potential issue (1 Medium)
- Patch 3 ("usb: typec: fusb302: Read out the RX FIFO rather tha..."): 2
  potential issues (2 Medium)
- Patch 5 ("usb: typec: fusb302: Acknowledge Get_Source_Cap_Exte..."): 5
  potential issues (4 Medium, 1 Low)
- Patch 6 ("usb: typec: fusb302: Acknowledge Get_Source_Cap_Exte..."): 7
  potential issues (7 Medium)

Detailed reviews have been sent as separate replies to patches 2, 3, 5,
and 6.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fusb302-ge=
tsourcecap-v2-0-6770eb1e7945@flipper.net
