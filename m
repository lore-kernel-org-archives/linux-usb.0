Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101963955C1;
	Sat, 10 Oct 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625658; cv=none; b=t5YFaG2oXUjbX3RO9XX3MPj2cRNWIRLE5p9NPtQzHF+Ll2zHabCDKDbJ1nsV2AKRhWMzTIeSJoBCUKMG8PEhIGc5gngdJ5f/0HFGk5BMQfdTOw22fu+GRAfM8sO5LvPWcjcp4p/ctc8eZIfcfZtyqOmTpKI47OOLiZrdGDdZ/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625658; c=relaxed/simple;
	bh=XzZIGT/DKFSr+J7bt8iCG8/8kgXqUQv37AiEYatuvBQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JRkur0IDp6HARsKHi8JM4aAjFhXbULz82/FU3Z4WOtYOKDI2MHx3YSRu/CzPOhOt+HNglhllm9cUZDfSTUqBrm7wjSBCC/YkHRgrIV1CHwbvTtLc7U3dfd0iNY3RJevmRVLX87NjZHV37PzsbNCnTw7Nq3ZDSd5x8izfx8bOcvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtN9rUod; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtN9rUod"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C371F000FF;
	Sat, 10 Oct 2026 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791625656;
	bh=XzZIGT/DKFSr+J7bt8iCG8/8kgXqUQv37AiEYatuvBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BtN9rUod8B8YXJgeFZ3/rbs/n5A1qIDxLaVlpphwl4hNPGO4oumllSGqAWQMaKvPU
	 ql46HakLM3kEUT5LB/rQSSucHyBFYb99ylVx21rVfySvRSveCHB8AXDY+Ee/YmOY8n
	 FtkXPdrCT3OF8IbHCVxXFvYf466kaEeKzK6ZDAnruEZ/YMYiK+Ub9ubHh2j1EmpK5o
	 59+6F/YAJ/8qbDGOGH5/d+cpp1sqIX3L2/Rzf0bt9ufxsMd9w6L3fBpJ8fM5LF1ngI
	 yKy1gXWwPYi4Qz39kLHb6Q1MqLWyWXLbqm+6F1F/C4dpyUqlDDoiWTLMo3+fe2Vf83
	 YA8KSAZOEifWQ==
Message-ID: <sashiko-outbox-166403@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 1/3] dt-bindings: usb: tps6598x: Add
 sn201202x/ACE3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20261010-tipd-ace3-v7-1-317218a96c01@chaosmail.tech>
References: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
 <20261010-tipd-ace3-v7-1-317218a96c01@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:47:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> A variant of tps6598x that is attached to a SPMI bus and is found on
> Apple devices starting from the M3 series
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-tipd-ace3-=
v7-0-317218a96c01@chaosmail.tech?part=3D1

