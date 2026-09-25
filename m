Received: from smtpfallback03.a1.net (smtpfallback03.a1.net [194.48.128.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD303B0594
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.48.128.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311125; cv=none; b=Mfi5rbVv9sp78B4PgvfELHC84oN+6yh3KREuoTHFxvoz0y0bENqhkPWs76ouP514+buHL2JdPIEQ7/DrNXKAQIcK0/lcxKq8hkEukJvzDmhkY429GS9JYFU2UrOAdG6s6i70dnS+JG8gYlTHaRrz8LTnIg3dweuyolHw9TMaRrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311125; c=relaxed/simple;
	bh=HRG1MFxvrzPoc2VrjKWyxwvDdasgqkmso1iU2u4WlCA=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lacra1GT7vQJJMmaJKTz0HOaP2ornwHjt4H4mCi0nudd0lN0p0zNkdVHQaQzqdkZ6hZh4oiKRVhEwku8aczyB3EoTinnp+RqVixdN8YlKymRrZaVmzzLzcljPhi6weCWbBBFdtUyzSDACZETpg/AMgOFtly5v4MazySF0KscsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=zfHVBJzm; arc=none smtp.client-ip=194.48.128.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="zfHVBJzm"
Received: from smtpout17.a1.net (unknown [10.247.84.8])
	by smtpfallback03.a1.net (Postfix) with ESMTPS id 4hrdHr6Tg6zYkjh8
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 06:38:32 +0200 (CEST)
Received: from [192.168.0.6] (unknown [100.72.67.144])
	by smtpout17.a1.net (Postfix) with ESMTPSA id 4hrdHf33btzGrqnn
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 06:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790311102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lx2dFeFxiCeSGvOHhDb82AeR097AwGgqN3IN96WMfn0=;
	b=zfHVBJzma8sd4A+WX8X+cXNDcGupCD4n4Z33WmKbbeGShRkZfwnL12UK6oYQY20+jdZGJS
	txSDpFLIaAtdSfzpXceu3dSg2ZdOukSiN9T6lEivpsOAghqbDP0i0a2KH5y4CQNQuDoh51
	MH22997gTTkYtFR/NAPOdpDwINJoewegVDAU/V5njdmsmaYYQN4hSsymDnaqTCpo+GNxnT
	/JDckk0EXt6KlvQbsmvszG0PPoOtWKyYpTBpYoAhcbp/TKGp6CVq/FAgn0a1iOBYU/ZKP7
	7Z09dQrB3cjJe0BmCCAhvJOWSH3umNgXt59eZ5avw3voyJaOj4J0BpwIPIDSX/K1DaSa11
	5UGXYUzovFgWvXCFSG6QBuWlnBW5ZAoHNqQ+xearxeiHK5DcxIuBjOnetMNHI4rjpmn9JS
	Zz9YZgwksSQeN48M+TOFEJgqA1gIoUKpKJx+Wmi+jck2rp/frIhWW73pdiW8/tnDy6podP
	4kxhWL3gL+pc+5n0IcB4SVcyx11a4xMnw1kcsU2h+/irC8e+5mDQgV8p+qMT5QwfWPoQrg
	fHO+sLJ9apNxKhPdQNPzvQyZJ0BImkw3zL8sSV9gRB9mkBKG/W3ib9hvuFwt0VDzgHJ4Af
	/YCB60pCfvVjEaPel+HcaK6PZmMEFsUA5X9I9R3gtB+EWS0OTx2Jo=
Subject: Re: possible regression in usb-storage?
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
 <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
 <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
 <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
Date: Fri, 25 Sep 2026 06:37:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Level: 



On 9/25/26 4:03 AM, Alan Stern wrote:
> 
> Maybe the drive doesn't like the 100-byte INQUIRY, even though it
> claims to support it.  You can test this by doing (as root):
> 
> 	echo 'Seagate:Expansion SW:1024' >/proc/scsi/device_info
> 
> before you plug in the drive.  That should suppress the 100-byte
> INQUIRY command.
> 
> Alan Stern
> 
I don't seem to have that file. Am I missing a module?
