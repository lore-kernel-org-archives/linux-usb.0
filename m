Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FD3EAC6D;
	Mon, 27 Jul 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147511; cv=none; b=aRt6JMm8ntxw4ERtOVnjmIYN9U5UUzUUf0pbYpcEbs328gL6XNBUtEPR4eLl0DhRXhhcJ8ly6/pegjYC5K+tINhe4v02c6sAMqgRPxkpN6ulhwH34wt+nQ7sbIeB1MH8rodbirvZinj2HWfunmxLPrrmcUXZcux6R23ww9Dx6uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147511; c=relaxed/simple;
	bh=4Zpgc91tvbK2NcS2X30QYhUYoNmd84hZYFzqhstUsyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLAy0Qpsuikf+YVGKHOJ0veZuqQ3oEVORbvPI6RM6i0p0gffOld3WJKGHILnMs3XQf3lrJs3ezZlTNMbsscvjfzUIcuYo7uh8DvS/SdB4Q20Qc2auS5mEC3faY8Ly1SNCIBtZnp4/jXu90dEhRFdiTNSvT5I34z0ihk8o+Hqotw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYxixka0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYxixka0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE4C1F000E9;
	Mon, 27 Jul 2026 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147509;
	bh=tm4bX5EaMEcOm+KUpSmElRPonEmmie0f+X4ECTvvYHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jYxixka0FlhauT4YJqj3Jfq5JgaoHCfQuUzMJ940VOmDeZ2ucrFT10LpKaeOY5aX9
	 Fsb5w94VOsRF+1E04eufzieRAL9zebAV/UEr9GkHBO93efzHnJQ0DngR2pSHa6LKJd
	 +FuvAr+gmMUSr8aqIKFMZVwWd/D1qTTjLq6RMR/bpST2nvoUyDmXhooRO5Z5g/2RcK
	 NlpFszwwKZ/FueD8GbXIeoQcouRlVvm5i7djRDiB9Os99FONj7gH9LS2Y62GBq+0Q5
	 TImTyF+igaEB/3WT6ZThTL/BNkADmgUkG+2hUrLnXUqRwzxJpHcuJXjd8lRGb7jDxI
	 jd7HvIhSy/8Ew==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Move CONFIG_QE_GPIO to SoC
Date: Mon, 27 Jul 2026 12:17:59 +0200
Message-ID: <178514745088.65524.3935355950831235390.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
References: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=chleroy@kernel.org; h=from:subject:message-id; bh=uN4DlDlGUY5Xyerk30O+tWmKQX/egw2gDnpOL+pthDo=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSlG0Qz821INK3tnj4tvcWuuDhDnvHzm75w1sots+dsm 1Bb3Xeqo5SFQYyLQVZMkeX4f+5dM7q+pOZP3aUPM4eVCWQIAxenAEzkqxHD/1IbnygBmyABewNf k6W31CSKzc/dcb2nKKO6Tz9s7i8RPoY/3MtW8bV8UmjQ67UI2mC3Y8XEf2kvrvlkTPB+8N3404R aFgA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Mon, 27 Jul 2026 10:45:37 +0200, Christophe Leroy (CS GROUP) wrote:
> Commit 7aa1aa6ecec2 ("QE: Move QE from arch/powerpc to drivers/soc")
> moved QE into drivers/soc including gpio.c but left CONFIG_QE_GPIO
> in powerpc's Kconfig.
> 
> Move it to SoC as well as it is the only place it is used:
> 
>   drivers/soc/fsl/qe/Makefile:obj-$(CONFIG_QE_GPIO)       += gpio.o qe_ports_ic.o
>   include/soc/fsl/qe/qe.h:#ifdef CONFIG_QE_GPIO
>   include/soc/fsl/qe/qe.h:#endif /* CONFIG_QE_GPIO */
> 
> [...]

Applied, thanks!

[1/1] powerpc: Move CONFIG_QE_GPIO to SoC
      commit: 6599935a1e4be0354326086ea6c73dcb8f43b881

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
