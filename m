Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.91.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782112;
	b=DTC6mxu39LF20GP1bbuI2KeAMdKcWwtr2uAqKqbkvEsUQmgMAtLKVVdT1CpC9OO4Bas5
	 NkDBxi8b4yOMvkQ5ghiEYhUa2Ksbs6o4yfirCLHxVQNojV3V9dF4HkYb3TeBYfWGuyiWh
	 w+egFh50wOB4nrIwn0dTfIWLt9X/khqE+pSfm3FB1/GHzKSMNBZGZBTUCU0ibXc1Hr7mu
	 R0VQj4R6Mh5S1WBdsbMTEon8ac69roc6YIX1TsPAVc9dxJlmJbsWse6MOr9/FI3dOyB79
	 f4FmSi/o1I2TFs3tj2TvKOK9t0IBpg+kLNO6K91PrB55yWKRxssLvx8dbk+qgKnilxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782112;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:X-JNJ;
	bh=NtX3+RsTY3GVKmc0tLvQPyu1M4G4lLLbwKVaKhrDo78=;
	b=KhpCnzGmEwXEficLn4vCRuOoCoEonlCRdDIflxhGuYb1MusKF5Ee9moGt7PJ1GBXPwKP
	 QjD78CDzBzmd243LJ/uBP3vzzecOAeTq7I/FaeUkZZ9MESqAKJW80uS8LtaZRCsY5wfcM
	 Sh3dFD78EhjPMuAgQ2furqJYRrbmp4nQXL35OGbSteOlHWVwp4eO1j4c5x+py6/IQU56k
	 RJYqcQxmxm69o1j3ucZzE1/A4MPpYkT6LZAbVmImYIPi1PMQ8g5HhqY7CYzI8vX1OwL2+
	 vc7ON/q3M+xGHqudnaxJe4gcdV5VubG0PihSa4vUu7TUloXUOnPk5/IR+AlC7uypdNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=me.com;
	spf=pass smtp.mailfrom=me.com;
	dkim=pass header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=W7pyHhUD;
	arc=none smtp.remote-ip=57.103.91.120
Received: from outbound.ci.icloud.com (ci-2001l-snip4-7.eps.apple.com [57.103.91.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5F2606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 19:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=W7pyHhUD
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPS id BED6F18009F9;
	Fri, 23 Oct 2026 19:01:48 +0000 (UTC)
X-ICL-RepId: 01a16a24-081b-783d-aa05-d431a1b4c78e
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhBAkMFXgdeDkAdXABYEhVdRVcEWAxdE1EZRQhEK18VFxtcABcNVk1UHR0OWAYSAlpFBk1fDl4fBBdGGVUERx5dVlAEGQJRHFYNV0NUBF9QSQxBUGxaAEcXSB1dGVlvUF0cDgBSRVEfVFheBFNWDkIJSgVcB1kBQQBIAl0DRQNBCksAXBpaHxRQF1QCVANTBlwLcwBSRVEfVEYTGU4bV01QG18CQg8=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1792782110; x=1824318110; bh=NtX3+RsTY3GVKmc0tLvQPyu1M4G4lLLbwKVaKhrDo78=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=W7pyHhUDYHeBkZqoXJzmzovVHJtev1MqUQ2ZWI9654gMfx7yqK2VOCwm/ArMwClm25PhV1nV7cIxZlyq0eJwjy2dYoFq/SYpZf2vFG7DQnRDU4GJ4Fs2S5kHM/Fb1A5PrDvmtX8bnQtIm96muTJu/XgDfVZzzrczIJ4bnvMdeH5p7pS2Y41a3swLcYJf1Po65tUoTwLVO1XpmebEMvC8BPo/qFyl1dGpyKRVTyXV5DdIxLyVLAgeSFie4D365Y2VS9yQB+U3bYFZXmM3LcBmoqLs4u0xRKwxkt6mBjurvAmux5iLfkNbPYHQLHDAFYoXkCEq8jL+4AqOXW32AYfQyw==
Received: from PROART.taile9cf10.ts.net (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPSA id 0232C1800273;
	Fri, 23 Oct 2026 19:01:46 +0000 (UTC)
From: Diogo Chaves <diogochaves@me.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	regressions@lists.linux.dev,
	Yiyu Zhou <yiyu@yiyuzhou.io>
Subject: Re: [REGRESSION] xhci: 3x descriptor timeout behind a vanished hub since 7.3
Date: Fri, 23 Oct 2026 16:01:04 -0300
Message-ID: <20261023190104.113331-1-diogochaves@me.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <a10e27de-f188-487f-bb45-bca27d904d06@linux.intel.com>
References: <20261023132616.339833-1-diogochaves@me.com> <a10e27de-f188-487f-bb45-bca27d904d06@linux.intel.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3NCBTYWx0ZWRfX7Qj9kuxFNTWW
 LurbPfE0vz0+yuG6shnq4xyysOvJw3kxHbHJ8MrIOmtoK6Kath8u0pGrQGtjDa7AeVZ54Fcuhu/
 22/Dqovwxvue4LUE3qd2o/LU1MlYTRaHP3B13o75iEJwwK7jMLjW8Q/zjV+X0W7cqnSCrJIeNNA
 eXVEYqyVg3Lq6WnTy49f0P+J2u30bZB6K/Tmad5k1X2JJznyItPQigF63+SL16FcUZVwMcOqod5
 jaD0NrMBSXRBKmeHYn+d/FY8v3Z/jSaR1IvbUxUsVVFZMwqA7xM7LLXM4u/tyfhA6gvuUhuymfr
 9cjko2Jfr092TgtpA7tuO435Yb3dtgl1JHa9yQa0waxMjOI4PqLlOOU13lYcIs=
X-Proofpoint-GUID: DySGhxaTH30pDKZ2Uvxp7__N0mEMDqBk
X-Proofpoint-ORIG-GUID: DySGhxaTH30pDKZ2Uvxp7__N0mEMDqBk
X-Authority-Info-Out: v=2.4 cv=c6SmgB9l c=1 sm=1 tr=0 ts=6adbaf1d
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=HlUpRvj5PA4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=HHGDD-5mAAAA:8
 a=6btwtICwW4nUQ7u8hscA:9
X-JNJ: AAAAAAABseYEnQyT5BX/YVyuZCNNMvjMXW3ffvmsfOQemfLjiSv9R+GFys44L2LryW64+RdO2O4Hazo4iIp70qr948eFAWbZyd/M2ASpGkK8v6WVmCDqNHSuirR2BBfw8xCiBxceTc5FOICXa69Vn3AWybXU+fbOnbxrhoY6Ds4EJKEuw4/2BBP91OPDTYPevQ5CBcrrwtfYDpX75npkJvRLgIKdS+x+nZeFiqIKCaeKYNO82gyauJhZL1i7ddesmQKAp+kIU7l0DwUzpWHSisWRfyYUPxbRgHTqyyBJ64RCA6v3v751XnEoaqA//Ocm+0Z5VUpqLkVojUT5Fpff6Y/BPHoG56+bscOzfQTmtvjUF9lSYUO88yC308nBSDdyOM53SkdY0u0+T5IH7ocLY4+g8uhHJF3WOWDZHUiw4A0x56Otfeoqz9ocp3dU7MyjDoWJIcW+3KdLor/qHBU8xnA/FCnoFLrnxvkNVCTOPQohGBHe+CXAehiUl8J6WYIwYyXWBis422JadEi9TMPkjOl5En2eyaEKR0/O0aiSXK8jTC336r1nhi6ExYAC9WzBr8F9ivm8e9Rg/Ad6nDBrxf3S3n+x7tntMZkUB3fM+EI9s0YHTg7hjPNgmucrzM/WUAcg32e+1McNSRPqwQknB4JXB3JafL+ZtvuLIrbQ6hJHhXUbvU1l0hd6CsqNv3idhTHfB0WnZeFQAaXkcMt34eRf07CdNs7Yh1FS/XuoI7Ibv+/0t+ygWUNo3P8P2k5UwUJ+Kurc00tNWUqLImSQPJvQDfj4z5vGkV2M2LSU+zonrBjrA0UQPmz7UBtIWpzchu5rEuMvlHPglLgcRA+pcGaFRJTFPDIw5AhTjy4msq/ABo87VNd+Jjt3JA1U6s/mIwCcy07T1EWrjIgzXpZAdi3fb+l96FfL2Ch/StwHBd1LyZ72y2cE/KH5Fa1RchImpoj+vlMDA0H3afg3wPhp/8fRIrozhg+
 8G5/m64nUDD/WyMfrJpdjI3ohunUUSLF/0fCaGr2KhSEG2PhPOfXa5+iG5J508NPh0YE/OLbdi5MOmQXRz3qWIEcGnemVKiNMotushd8bWwc0feE6lBIuc8z3mgpKxn9to3O7xccNgtPg99kPH1kf6JASyYLLib6t0g3h3fLj5oNRNHmd6WmmIbx8jB0eZPcJfv8Pl7lAkuiWBv9pMlf/nKdOQ5ScIF7ULs6ZlqLj9hpd4BRv5WizA3OsITkSUGJUtk90D5WRhfNXx0MDu0M0OSd6vCf+8B08SDdbznr3wolMZO/0LS6e9fsdEp4BBvo5HdjLbCGzkDJU9YgzLHa5qCtgoQ==

On 10/23/26 17:33, Mathias Nyman wrote:
> This is very likely the case. This same issue was reported, and fixed in:
>
> https://lore.kernel.org/linux-usb/20261013073825.17962-1-yiyu@yiyuzhou.io/
>
> Does it fix your case?

Yes, it does. I tested v7.3 + 1f36cc9fa949 ("xhci: give back all TDs
when skipping endpoint reset after disconnect") from your for-usb-linus,
with the same config and usbcore.initial_descriptor_timeout=1000 as
before. Time from `usb 1-1.1: new full-speed` to
`usb 1-1-port1: attempt power cycle`:

                        boot         wake 1  wake 2  wake 3
  v7.3                  0.1          3.1     3.1     3.1 s
  v7.3, both reverted   0.03         0.03    0.03    0.03 s
  v7.3 + 1f36cc9fa949   0.03, 0.19*  0.03    0.03    0.03 s

  * the race hit twice at boot. The second time, the hub went away
    160 ms into 1-1.1's enumeration, and the port was power-cycled
    31 ms after `usb 1-1: USB disconnect`.

There was no `error -110`, `error -71` or `cannot reset` in that boot.
Both receivers were back 5.9-8.5 s after the first drop, the same as
with the revert (5.9-8.2 s).

Tested-by: Diogo Chaves <diogochaves@me.com>

#regzbot fix: xhci: give back all TDs when skipping endpoint reset after disconnect

Thanks to you and Yiyu.

Diogo
