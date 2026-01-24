Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB52173
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274809; cv=none; b=JicFBYCIAqW+ohFjuxQ9Lz3zNjWlGS3Ib0/NGFTIHk5uDafE08L7J3aWSeoPoYGh6m1saj/jO6vhB5ZABIiglP19rtmbLg0djwvNRiPGQO+dwpADCVeNhWw6B/TXbb6RTb4iLVbEwjtQep1yPR7W9bwdLvcPTGYQYu3XhKrzHtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274809; c=relaxed/simple;
	bh=v5RyRvfN0M2eqt7l7eGpWmcdJ+jwR5OE6pbTVeqbNCQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-ID:References:To; b=hdni7hO3x95I74Y6LpS50tQS21cPX3HxSAxsNUmIfneyTDECfYf8d9UOu/Fo9B+cQeGUQdWUb9g2sfNp5VEgV2E4oINYhuZuO3Pbrl7/P9pE2JQ+Nxxo1JRZ5ZbLnmQ2vUmtrnzI/dg57KSJ2NUXEUspfuKVUN9M5N0ijWCqW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b=Le70g2oC; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=b/j1bw7u; arc=none smtp.client-ip=54.240.27.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b="Le70g2oC";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="b/j1bw7u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4vmhj3boyfilqttfply4nxrhvlvpcgyy; d=hernandez-ros.com;
	t=1769274808;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
	bh=v5RyRvfN0M2eqt7l7eGpWmcdJ+jwR5OE6pbTVeqbNCQ=;
	b=Le70g2oCYUiHgpLqhIOceNF/ufeMp8OTYHQ2iMt7NwMgbgSxA4WALCY5Zv9sCFtt
	6raXm2vfo3EiJwPufF8OXiiRIiOYSuYeCfB52pwHM9JdUKlSpEIbYwHgXQKcrYnPVlI
	1aG94UUXe0OrrhEcZDevisTBAx/ABUK48z1TCIvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769274808;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
	bh=v5RyRvfN0M2eqt7l7eGpWmcdJ+jwR5OE6pbTVeqbNCQ=;
	b=b/j1bw7uPv8zxEH6UtUBO1NL4ABPTq231lXSkMaWoEPyT1iuy5N7fDZ+2WTDS/wH
	q2qeEDiowUCyvzYGZYfG16lTi8GqTIJzLq7JZ+cFLKuz6QNi9PKRIvQQxuPt1LE3pyt
	qoZ6PeuwJ9OLmSfkyTufJW+kL2xvS1uIV4c6r3S0=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
From: =?utf-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>
In-Reply-To: <7f22aca9-baa4-4438-b568-2b197f971739@kernel.org>
Date: Sat, 24 Jan 2026 17:13:28 +0000
Cc: valentina.manea.m@gmail.com, linux-usb@vger.kernel.org, i@zenithal.me
Content-Transfer-Encoding: 7bit
Message-ID: <0101019bf0ff17d4-3afd0632-19b1-4aaf-8aed-b82ef457ece1-000000@us-west-2.amazonses.com>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
 <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
 <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
 <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
 <0101019bc32d3017-88891fcf-4b22-45d8-b8e4-c18a30dbbe15-000000@us-west-2.amazonses.com>
 <63f2d81c-79ce-4568-99fa-c47da98afd78@kernel.org>
 <a56209d4-13d5-40cb-b759-f9c7870fb842@kernel.org>
 <0101019bdf6ca137-60344502-51d2-4767-a34b-6a7cf1bfdf4a-000000@us-west-2.amazonses.com>
 <7f22aca9-baa4-4438-b568-2b197f971739@kernel.org>
To: Shuah <shuah@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
Feedback-ID: ::1.us-west-2.HjGwZwg5MFiEpu6H35PNuAp1STds0CnEvbYH/ASzZjo=:AmazonSES
X-SES-Outgoing: 2026.01.24-54.240.27.45

Hi

> Is there a way you can enable usbip debug and send me the dmesg?
> 
> -- Shuah

Done. You can access the dmesg with DEBUG information from here: 
https://reportingstandard.com/dmesg-log.txt

Ignacio

